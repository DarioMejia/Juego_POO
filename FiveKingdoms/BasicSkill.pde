class BasicSkill extends Skill {

  BasicSkill(String name, int damage, int energyCost, PVector movSpeed, PVector position, PVector size, PImage aspect) {
    super(name, damage, energyCost, movSpeed, position, size, aspect);
  }
  
  BasicSkill(Skill skill){
    super(skill.name, skill.damage, skill.energyCost, skill.movSpeed, skill.position, skill.size, skill.aspect);
  }
  
  void display() {
    if (this.position.x > width - this.size.x/1.55) {
    } else {
      image(this.aspect, this.position.x, this.position.y, this.size.x, this.size.y);
    }
  }

  void move() {
    this.position.x = this.position.x+this.movSpeed.x;
  }
}
