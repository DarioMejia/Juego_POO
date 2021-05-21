class BasicSkill extends Skill {
  Fighter fighter;
  boolean notShow;

  BasicSkill(String name, int damage, int energyCost, PVector movSpeed, PVector position, PVector size, PImage aspect) {
    super(name, damage, energyCost, movSpeed, position, size, aspect);
    notShow = false;
  }

  BasicSkill(Skill skill) {
    super(skill.name, skill.damage, skill.energyCost, skill.movSpeed, skill.position, skill.size, skill.aspect);
  }

  void setFighter(Fighter fighter) {
    this.fighter = fighter;
  }

  void setNotShow() {
    notShow = true;
  }

  void display() {
    if (((this.position.x > width - this.size.x/1.55)||(this.position.x < -50 )) | notShow) {
      notShow = false;
    } else {
      image(this.aspect, this.position.x, this.position.y, this.size.x, this.size.y);
    }
  }

  void move() {
    this.position.x = this.position.x+this.movSpeed.x;
  }
}
