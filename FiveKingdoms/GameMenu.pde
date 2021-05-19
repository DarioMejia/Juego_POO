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
        fighterLeft = new Fighter ("kris", 150, 3, 0, new PVector(0, 7), new PVector(50, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspect);
        fighterRight = new Fighter ("kris", 150, 3, 0, new PVector(0, 7), new PVector(1100, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspectRight, true);
        fighterLeft.setBasicSkill(new BasicSkill("daga", 5, 1, new PVector(20, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), krisBasicDaga));
        fighterRight.setBasicSkill(new BasicSkill("daga", 5, 1, new PVector(-20, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), krisBasicDagaRight));
      }
      mainMenuButton2.display();
      fighterRight.init();
      fighterLeft.init();
      displayManna();
      damageDone();
      break;
    }
  }

  void displayManna() {
    if (frameCount % 10 == 0) {
      fighterLeft.addManna(1);
      fighterRight.addManna(1);
    }
  }

  void damageDone() {

    for (Skill skill : fighterRight.skills) {
      if (skill.getPosition().x > fighterLeft.getPosition().x - fighterLeft.getSize().x / 2 & skill.getPosition().x < fighterLeft.getPosition().x + fighterLeft.getSize().x / 2 &
        skill.getPosition().y > fighterLeft.getPosition().y - fighterLeft.getSize().y / 2 & skill.getPosition().y < fighterLeft.getPosition().y + fighterLeft.getSize().y / 2) {
        skill.setNotShow();
        skill.display();
        if ((fighterLeft.getHealth() - skill.getDamage()) > 0) {
          fighterLeft.setHealth(fighterLeft.getHealth() - skill.getDamage());
        } else {
          fighterLeft.setHealth(0);
        }
        println("L" + fighterLeft.getHealth());
      }
    }

    for (Skill skill : fighterLeft.skills) {
      if (skill.getPosition().x > fighterRight.getPosition().x - fighterRight.getSize().x / 2 & skill.getPosition().x < fighterRight.getPosition().x + fighterRight.getSize().x / 2 &
        skill.getPosition().y > fighterRight.getPosition().y - fighterRight.getSize().y / 2 & skill.getPosition().y < fighterRight.getPosition().y + fighterRight.getSize().y / 2) {
        skill.setNotShow();
        skill.display();
        if ((fighterRight.getHealth() - skill.getDamage()) > 0) {
          fighterRight.setHealth(fighterRight.getHealth() - skill.getDamage());
        } else {
          fighterRight.setHealth(0);
        }
        println("R" + fighterRight.getHealth());
      }
    }
  }

  void keyReleasedGameMenu() {

    if (gameMenuPage == 0) {

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
      }
    }
  }
}
