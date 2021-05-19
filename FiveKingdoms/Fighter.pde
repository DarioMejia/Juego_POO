class Fighter implements FighterActions {

  ArrayList<Skill> skills;
  String name;
  int health, basicSkillCapacity, numBasic, frameStart;
  boolean location;
  PImage aspect;
  PVector movSpeed, position, size;

  Fighter (String name, int health, int basicSkillCapacity, PVector movSpeed, PVector position, PVector size, PImage aspect) {
    this.name = name;
    this.health = health;
    this.basicSkillCapacity = basicSkillCapacity;
    this.movSpeed = movSpeed;
    this.position = position;
    this.size = size;
    this.aspect = aspect;
    skills = new ArrayList<Skill>();
    numBasic = 0;
    frameStart = 120;
  }



  Fighter(String name, int health, int basicSkillCapacity, PVector movSpeed, PVector position, PVector size, PImage aspect, boolean location) {
    this(name, health, basicSkillCapacity, movSpeed, position, size, aspect);
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


  void setHealth(int health) {
    this.health = health;
  }

  void restElixir(int resta) {
  }

  void init() {
    display();
    move();
  }

  void display() {
    image(this.aspect, this.position.x, this.position.y, this.size.x, this.size.y);
    stroke(100);
    fill(#29B2D6);
    if (location) {
      rect(1200, 20, 25*10, 10);
    } else {
      rect(20, 20, 25*10, 10);
    }

    for (Skill s : skills) {
      s.init();
    }
  }

  void displayHealth() {
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
    PVector a = new PVector(0, 0);
    a.y = position.y;
    a.x = position.x;
    skills.get(i).setPosition(a);
  }
  void setSkill() {
  }
}
