class GameMenu {
  int energyFighterLeft, energyFighterRight;
  boolean location;
  Fighter fighterLeft, fighterRight;

  GameMenu() {
  }

  void runGameMenu(int gameMenuPage) {
    image(gameMenuBack[0], 0, 0, width, height);
    switch (gameMenuPage) {
    case 0:
      if (fighterLeft == null && fighterRight == null) {
        fighterLeft = new Fighter ("kris", 150, 3, 0, new PVector(0, 10), new PVector(0, height/2-250/1.55), new PVector(250/1.55, 250/1.55), fighter1);
        fighterRight = new Fighter ("kris", 150, 3, 0, new PVector(0, 10), new PVector(1100, height/2-250/1.55), new PVector(250/1.55, 250/1.55), fighter12, true);
        fighterLeft.setBasicSkill(new BasicSkill("daga", 5, 1, new PVector(25, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), fighter1Basic));
        fighterRight.setBasicSkill(new BasicSkill("daga", 5, 1, new PVector(-25, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), fighter12Basic));
        fighterRight.setSkill(new SpecialSkill("onda de fuego", 15, 5, new PVector(35, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), fighter12Special1));
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
      if (skill.getPosition().x > fighterLeft.getPosition().x - fighterLeft.getSize().x / 2 & skill.getPosition().x < fighterLeft.getPosition().x + fighterLeft.getSize().x / 2 &
        skill.getPosition().y > fighterLeft.getPosition().y - fighterLeft.getSize().y / 2 & skill.getPosition().y < fighterLeft.getPosition().y + fighterLeft.getSize().y / 2) {
        skill.setNotShow();
        if ((fighterLeft.getHealth() - skill.getDamage()) > 0) {
          fighterLeft.setHealth(fighterLeft.getHealth() - skill.getDamage());
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
        fighterLeft.shootBasic();
        break;

        //Player in the left side
      case 'l':
        fighterRight.changeDirec();
        break;
      case 'k':
        fighterRight.shootBasic();
        break;
        case 'j':
        fighterRight.shoot(3);
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
