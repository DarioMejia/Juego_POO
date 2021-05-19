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

  void init() {
    notShow = false;
    display();
    move();
  }

  void display() {
    if (!(this.position.x > width - this.size.x/1.55)) {
      image(this.aspect, position.x, position.y, this.size.x, this.size.y);
    }
  }



  void move () {
    this.position.x = this.position.x+this.movSpeed.x;
  }

  public PVector getMovSpeed() {
    return movSpeed;
  }

  public void setMovSpeed(PVector movSpeed) {
    this.movSpeed = movSpeed;
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

  public int getDamage() {
    return damage;
  }
  
    public void setNotShow() {
  }
  
  public boolean getNotShow() {
    return notShow;
  }
} 
