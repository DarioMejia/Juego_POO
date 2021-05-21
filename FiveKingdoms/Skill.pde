abstract class Skill {

  String name;
  int energyCost, damage;
  PImage aspect;
  PVector movSpeed, position, size;
  boolean notShow;

  Skill(String name, int damage, int energyCost, PVector movSpeed, PVector position, PVector size, PImage aspect) {
    this.name = name;
    this.aspect = aspect;
    this.energyCost = energyCost;
    this.damage = damage;
    this.movSpeed = movSpeed;
    this.position = position;
    this.size = size;
  }

  public PVector getMovSpeed() {
    return movSpeed;
  }

  public void setMovSpeed(PVector movSpeed) {
    this.movSpeed = movSpeed;
  }
  public PImage getAspect() {
    return aspect;
  }

  public void setAspect(PImage aspect) {
    this.aspect = aspect;
  }

  public PVector getPosition() {
    return position;
  }

  public void setPosition(PVector position) {
    this.position = position;
  }

  public PVector getSize() {
    return size;
  }

  public void setSize(PVector size) {
    this.size = size;
  }

  public int getEnergyCost() {
    return energyCost;
  }

  public void setEnergyCost(int energyCost) {
    this.energyCost = energyCost;
  }

  public int getDamage() {
    return damage;
  }

  public void setDamage(int damage) {
    this.damage = damage;
  }

  public String getNameSkill() {
    return name;
  }

  public void setNameSkill(String name) {
    this.name = name;
  }

  public void setNotShow() {
  }

  public boolean getNotShow() {
    return notShow;
  }

  void init() {
    notShow = false;
    display();
    move();
  }

  void display() {
    if (!(this.position.x > width - (this.size.x/1.55)+50)) {
      image(this.aspect, position.x, position.y, this.size.x, this.size.y);
    }
    if (!(this.position.x < 50)) {
      image(this.aspect, position.x, position.y, this.size.x, this.size.y);
    }
  }



  void move () {
    this.position.x = this.position.x+this.movSpeed.x;
  }
} 
