class GameMenu {
  int energyFighterLeft, energyFighterRight;
  boolean location;
  Fighter fighterLeft, fighterRight;
  PVector far;
  GameMenu() {
  }

  void runGameMenu(int gameMenuPage) {
    image(gameMenuBack[0], 0, 0, width, height);
    switch (gameMenuPage) {
    case 0:
      if (fighterLeft == null && fighterRight == null) {
        fighterLeft = new Fighter ("kris", 150, 3, 0, new PVector(0, 10), new PVector(0, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspect);
        fighterRight = new Fighter ("kris", 150, 3, 0, new PVector(0, 10), new PVector(1100, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspectRight, true);
        fighterLeft.setBasicSkill(new BasicSkill("daga", 5, 1, new PVector(25, 0), new PVector(1000, 1000), new PVector(250/1.55, 250/1.55), krisBasicDaga));
        fighterRight.setBasicSkill(new BasicSkill("daga", 5, 1, new PVector(-25, 0), new PVector(1000, 1000), new PVector(250/1.55, 250/1.55), krisBasicDagaRight));
        fighterLeft.setSkill(new SpecialSkill("onda de fuego", 15, 5, new PVector(35, 0), new PVector(1000, 1000), new PVector(350/1.55, 650/1.55), fire_wave_kris));
        fighterRight.setSkill(new SpecialSkill("onda de fuego", 15, 5, new PVector(-35, 0), new PVector(1000, 1000), new PVector(350/1.55, 650/1.55), fire_wave_kris_p2));
        fighterLeft.setSkill(new SpecialSkill("escudo", 0, 4, new PVector(0, 0), new PVector(1000, 1000), new PVector(250/1.55, 250/1.55),  kris_with_shield));
        fighterRight.setSkill(new SpecialSkill("escudo", 0, 4, new PVector(0, 0), new PVector(1000, 1000), new PVector(250/1.55, 250/1.55),  kris_with_shield_p2));
      }

      fighterRight.init();
      fighterLeft.init();
      displayManna();
      damageDone();     
      break;
    }
  }

  void displayManna() {
    if (frameCount % 30 == 0) {
      fighterLeft.addManna(1);
      fighterRight.addManna(1);
    }
  }

  void damageDone() {

    for (Skill skill : fighterRight.skills) {
      far = new PVector(1000, 1000);
      if (skill.getPosition().x > fighterLeft.getPosition().x - fighterLeft.getSize().x / 2 & skill.getPosition().x < fighterLeft.getPosition().x + fighterLeft.getSize().x / 2 &
        skill.getPosition().y > fighterLeft.getPosition().y - fighterLeft.getSize().y / 2 & skill.getPosition().y < fighterLeft.getPosition().y + fighterLeft.getSize().y / 2) {
        skill.setNotShow();
        if ((fighterLeft.getHealth() - skill.getDamage()) > 0) {
          fighterLeft.setHealth(fighterLeft.getHealth() - skill.getDamage());
          skill.setPosition(far);
        } else {
          fighterLeft.setHealth(0);
        }
        println("L" + fighterLeft.getHealth());
        if (fighterLeft.getHealth()<=0) {
          gameMenuPage = 2;
        }
      }
    }

    for (Skill skill : fighterLeft.skills) {
      if (skill.getPosition().x > fighterRight.getPosition().x - fighterRight.getSize().x / 2 & skill.getPosition().x < fighterRight.getPosition().x + fighterRight.getSize().x / 2 &
        skill.getPosition().y > fighterRight.getPosition().y - fighterRight.getSize().y / 2 & skill.getPosition().y < fighterRight.getPosition().y + fighterRight.getSize().y / 2) {
        skill.setNotShow();
        if ((fighterRight.getHealth() - skill.getDamage()) > 0) {
          fighterRight.setHealth(fighterRight.getHealth() - skill.getDamage());
          skill.setPosition(far);
        } else {
          fighterRight.setHealth(0);
        }
        println("R" + fighterRight.getHealth());
        if (fighterRight.getHealth()<=0) {
          gameMenuPage = 1;
        }
      }
    }
  }

  void keyReleasedGameMenu() {

    switch (gameMenuPage) {
    case 0:

      switch (key) {
        //Player in the left side
      case 'a':
        fighterLeft.changeDirec();
        break;
      case 's':
        if(fighterLeft.skills.get(1).getEnergyCost()<fighterLeft.getManna()+1){
        fighterLeft.shootBasic();
        }
        break;
        case 'd':
        if(fighterLeft.skills.get(3).getEnergyCost()<fighterLeft.getManna()+1){
        fighterLeft.shootSpecial();
        }
        break;
        case 'w':
        if(fighterLeft.skills.get(4).getEnergyCost()<fighterLeft.getManna()+1){
        fighterLeft.shootSpecial(fighterLeft.skills.get(4).getAspect());
        }
        break;

        //Player in the left side
      case 'l':
        fighterRight.changeDirec();
        break;
      case 'k':
        if(fighterRight.skills.get(1).getEnergyCost()<fighterRight.getManna()+1){
        fighterRight.shootBasic();
        }
        
        break;
        case 'i':
        if(fighterRight.skills.get(3).getEnergyCost()<fighterRight.getManna()+1){
        fighterRight.shootSpecial();
        }
        break;
        case 'j':
        if(fighterRight.skills.get(4).getEnergyCost()<fighterRight.getManna()+1){
        //fighterRight.shootSpecial(true);
        }

        break;
      }
      break;
    case 1:
      gameMenuPage=0;
      setupMenu.runSetupMenu(setupMenuPage);
      fighterLeft = null;
      fighterRight = null;


      break;
    case 2:
      gameMenuPage=0;
      setupMenu.runSetupMenu(setupMenuPage);
      fighterLeft = null;
      fighterRight = null;
      break;
    }
  }
}
