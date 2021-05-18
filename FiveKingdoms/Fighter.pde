class Fighter implements FighterActions {

  ArrayList<Skill> skills;
  String name;
  int health, basicSkillCapacity;
  boolean location;
  float sec = map(second(), 0, 60, 0, width);
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
  }

  Fighter(String name, int health, int basicSkillCapacity, PVector movSpeed, PVector position, PVector size, PImage aspect, boolean location) {
    this(name, health, basicSkillCapacity, movSpeed, position, size, aspect);
    this.location = location;
  }

  void setBasicSkill(Skill skill) {
    for (int i = 0; i <= basicSkillCapacity; i++) {
      skills.add(skill);
    }
  }

  void setHealth(int health) {
    this.health = health;
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

  void shoot(int numBasic) {
    switch(numBasic) {
    case 0:
      skills.get(0).shoot(this);
      numBasic++;
      break;
    case 1:
      skills.get(1).shoot(this);
      numBasic++;
      break;
    case 2:
      skills.get(2).shoot(this);
      numBasic = 0;
      break;
    }
  }
}
