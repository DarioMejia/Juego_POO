class SpecialSkill extends Skill {
Fighter fighter;
  SpecialSkill(String name, int damage, int energyCost, PVector movSpeed, PVector position, PVector size, PImage aspect) {
    super(name, damage, energyCost, movSpeed, position, size, aspect);
  }
  SpecialSkill(Skill skill) {
    super(skill.name,skill.damage,skill.energyCost,skill.movSpeed,skill.position,skill.size,skill.aspect);
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
       this.position.x=9000;
       this.position.y=9000;
    } else {
      image(this.aspect, this.position.x, this.position.y, this.size.x, this.size.y);
    }

  }

  void move() {
    this.position.x = this.position.x+this.movSpeed.x;
  }
}
