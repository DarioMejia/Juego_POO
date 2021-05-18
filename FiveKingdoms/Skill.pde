abstract class Skill {
  
  String name;
  int energyCost, damage;
  PImage aspect;
  PVector movSpeed, position, size;

  Skill(String name, int damage, int energyCost, PVector movSpeed, PVector position, PVector size, PImage aspect) {
    this.name = name;
    this.aspect = aspect;
    this.energyCost = energyCost;
    this.damage = damage;
    this.movSpeed = movSpeed;
    this.position = position;
    this.size = size;
  }

  abstract void display();

  abstract void move();
} 
