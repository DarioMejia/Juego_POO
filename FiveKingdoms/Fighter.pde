class Fighter implements FighterActions {

  private int maxManna = 10;
  ArrayList<Skill> skills;
  String name;
  int health, basicSkillCapacity, manna, numBasic, frameStart;
  boolean location;
  PImage aspect;
  PVector movSpeed, position, size;

  Fighter (String name, int health, int basicSkillCapacity, int manna, PVector movSpeed, PVector position, PVector size, PImage aspect) {
    this.name = name;
    this.health = health;
    this.basicSkillCapacity = basicSkillCapacity;
    this.manna = manna;
    this.manna =5;
    this.movSpeed = movSpeed;
    this.position = position;
    this.size = size;
    this.aspect = aspect;
    skills = new ArrayList<Skill>();
    numBasic = 0;
    frameStart = 120;
  }



  Fighter(String name, int health, int basicSkillCapacity, int manna, PVector movSpeed, PVector position, PVector size, PImage aspect, boolean location) {
    this(name, health, basicSkillCapacity, manna, movSpeed, position, size, aspect);
    this.location = location;
  }

  void setBasicSkill(Skill skill) {
    BasicSkill tempSkill;
    for (int i = 0; i < basicSkillCapacity; i++) {
      tempSkill = new BasicSkill(skill);
      tempSkill.setFighter(this);
      skills.add(tempSkill);
    }
  }

  void setNameFighter(String name) {
    this.name = name;
  }

  String getNameFighter() {
    return name;
  }
    void setAspcerFighter(PImage aspect) {
    this.aspect = aspect;
  }

  PImage getAspecFighter() {
    return aspect;
  }

  void setHealth(int health) {
    this.health = health;
  }

  int getHealth () {
    return health;
  }

  void setPosition (PVector position) {
    this.position = position;
  }

  PVector getPosition() {
    return position;
  }

  void setSize (PVector size) {
    this.size = size;
  }

  PVector getSize() {
    return size;
  }

  void addManna(int cant) {
    if (manna < 10) {
      manna += cant;
    }
  }
  int getManna() {
    return manna;
  }

  void restManna(int cant) {
    if (manna > 0) {
      manna -= cant;
    }
  }

  void init() {
    display();
    move();
  }

  void display() {
    image(this.aspect, this.position.x, this.position.y, this.size.x, this.size.y);

    for (Skill s : skills) {
      s.init();
    }

    displayMannaLevel();
    displayHealth();
  }

  void displayMannaLevel() {
    fill(255);
    if (location) {
    rect(position.x, 30, 196, 30);
    }else{
    rect(position.x+5, 30, 196, 30);
    }
    for (int i=1; i <= manna; i++) {
      stroke(100);
      fill(#29B2D6);
      if (location) {
        rect((position.x-i*20)+196, 30, 20, 30);
        
      } else {
        rect((position.x+i*20)-15, 30, 20, 30);
      }
    }
  }

  void displayHealth() {
        stroke(50);
    fill(0);
    if (!location){
      rect(0, 10, 300, 20);
    } else {
      rect(1000, 10, 300, 20);
    }
    noStroke();

    for (int i = 1; i < health/2; i++) {
      color rojo = color(255, 25, 25);
      color verde = color(100, 255, 51);
      color naranja=color(255, 178, 102);
      color verde1 = lerpColor(naranja, verde, .01*i);
      color rojo1 = lerpColor(rojo, naranja, .01*i);
      color naranja1 = lerpColor(rojo, verde, .01*i);
      if (i<(health/2)/3) {
        fill(rojo1);
      } else if (i<(health/2)/3+(health/2)/3) {
        fill(naranja1);
      } else if (i<health/2) {
        fill(verde1);
      }
      if (!location){
        rect (4 * i, 10, 3, 20);
      } else {
        rect (1300 + 4 * -i, 10, 3, 20);
      }
    }
  }

  void move() {
    this.position.add(this.movSpeed);
    if (this.position.y > height - this.size.y) {
      this.position.y = height - this.size.y - 10;
      changeDirec();
    } else if (this.position.y < 50) {
      this.position.y = 60;
      changeDirec();
    }
  }

  void changeDirec() {
    this.movSpeed.y *= -1;
  }

  void shootBasic() {
    boolean a = (frameCount > frameStart + 60);
    if (a) {
      switch(numBasic) {
      case 0:
        shoot(0);
        numBasic++;
        break;
      case 1:
        shoot(1);
        numBasic++;
        break;
      case 2:
        shoot(2);
        numBasic = 0;
        frameStart = frameCount  ;
        break;
      }
    }
  }
  void shootSpecial() {
    boolean a = (frameCount > frameStart + 60);
    if (a) {
      if(numBasic==  0) {
    
        shootSpecial(3);
        numBasic = 0;
        frameStart = frameCount ;
      }
    }
  }
  void shootSpecial(PImage b) {
    
    boolean a = (frameCount > frameStart + 60);
    if (a) {
      if(numBasic== 0) {
        Specialgetsbetter(b);
        numBasic = 0;
        frameStart = frameCount ;
      }
    }
  }
  void Specialgetsbetter(PImage b) {
    PImage aux;
    aux = getAspecFighter();
    boolean a = (frameCount > frameStart+60 );
    if(a){
        setAspcerFighter(b);
        numBasic = 1;
        frameStart = frameCount ;
      }else{
      setAspcerFighter(aux);
    }
    restManna(skills.get(4).getEnergyCost());
  }
  
void shootSpecial(int i) {
    
  PVector a = new PVector(0, 0);
    a.y = position.y;
    a.x = position.x-25;
    skills.get(i).setPosition(a);
    restManna(skills.get(3).getEnergyCost());
      }
    
  
  void shoot(int i) {
    PVector a = new PVector(0, 0);
    a.y = position.y;
    a.x = position.x+10;
    skills.get(i).setPosition(a);
    restManna(skills.get(numBasic).getEnergyCost());
  }

  void setSkill(Skill skill) {
    skills.add(skill);
  }
}
