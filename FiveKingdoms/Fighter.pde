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
    this.movSpeed = movSpeed;
    this.position = position;
    this.size = size;
    this.aspect = aspect;
    skills = new ArrayList<Skill>();
    numBasic = 0;
    frameStart = 60;
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
    fill(#000000);
    rect(position.x+20, 30, 310, 30);
    fill(#000000);
    rect(position.x+2*20, 30, 310, 30);

    for (int i=1; i <= manna; i++) {
      stroke(100);
      fill(#29B2D6);
      if (location) {
        rect(position.x+i*20-150, 30, 20, 30);
      } else {
        rect(position.x+i*20-50, 30, 20, 30);
      }
    }
  }

  void displayHealth() {
    stroke(50);
    fill(0);
    rect(150, 10, 300, 15);
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
      rect (4 * i, 10, 3, 15);
    }
  }

  void move() {
    this.position.add(this.movSpeed);
    if (this.position.y > height - this.size.y) {
      this.position.y = height - this.size.y - 10;
      changeDirec();
    } else if (this.position.y < 20) {
      this.position.y = 30;
      changeDirec();
    }
  }

  void changeDirec() {
    this.movSpeed.y *= -1;
  }

  void shootBasic() {
    boolean a = (frameCount > frameStart + 120);
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
        frameStart = frameCount ;
        break;
      }
    }
  }

  void shoot(int i) {
    if (skills.get(i).getNotShow()) {
      skills.get(i).setNotShow();
    }
    PVector a = new PVector(0, 0);
    a.y = position.y;
    a.x = position.x;
    skills.get(i).setPosition(a);
    restManna(skills.get(numBasic).getEnergyCost());
  }

  void setSkill() {
  }
}
