class GameMenu {
  int energyFighterLeft, energyFighterRight, winner;
  boolean location;
  Fighter fighterLeft, fighterRight;
  PVector far;
  GameMenu() {
    winner = 0;
  }

  public void setFighterLeft(Fighter fighterLeft) {
    this.fighterLeft = fighterLeft;
  }

  void setFighterRight(Fighter fighterRight) {
    this.fighterRight = fighterRight;
  }

  void runGameMenu(int gameMenuPage) {
    image(gameMenuBackground[0], 0, 0, width, height);
    switch (gameMenuPage) {
    case 0:
      gameMenuButtons.get(0).display();
      if (fighterLeft == null && fighterRight == null) {
        winner = 0;
        fighterLeft = new Fighter ("kris", 150, 3, 0, new PVector(0, 5), new PVector(0, height/2-250/1.55), new PVector(250/1.55, 250/1.55), fighter1);
        fighterRight = new Fighter ("kris", 150, 3, 0, new PVector(0, 5), new PVector(1100, height/2-250/1.55), new PVector(250/1.55, 250/1.55), fighter12, true);
        fighterLeft.setBasicSkill(new BasicSkill("daga", 5, 1, new PVector(12, 0), new PVector(1000, 1000), new PVector(250/1.55, 250/1.55), fighter1Basic));
        fighterRight.setBasicSkill(new BasicSkill("daga", 5, 1, new PVector(-12, 0), new PVector(1000, 1000), new PVector(250/1.55, 250/1.55), fighter12Basic));
        fighterLeft.setSkill(new SpecialSkill("onda de fuego", 15, 5, new PVector(17, 0), new PVector(1000, 1000), new PVector(350/1.55, 650/1.55), fighter1Special1));
        fighterRight.setSkill(new SpecialSkill("onda de fuego", 15, 5, new PVector(-17, 0), new PVector(1000, 1000), new PVector(350/1.55, 650/1.55), fighter12Special1));
        fighterLeft.setSkill(new SpecialSkill("escudo", 0, 4, new PVector(0, 0), new PVector(1000, 1000), new PVector(250/1.55, 250/1.55), fighter1Special2));
        fighterRight.setSkill(new SpecialSkill("escudo", 0, 4, new PVector(0, 0), new PVector(1000, 1000), new PVector(250/1.55, 250/1.55), fighter12Special2));
      }
      fighterRight.init();
      fighterLeft.init();
      displayManna();
      damageDone();     
      break;

    case 1:
      image(gameMenuBackground[0], 0, 0, width, height);
      image(optionsBackground, 300, 100, 700, 500);
      if (winner == 0) {
        for (int i = 1; i < 4; i++) {
          gameMenuButtons.get(i).display();
        }
      } else {
        for (int i = 2; i < 4; i++) {
          gameMenuButtons.get(i).display();
        }
        if (winner == 1) {
          image(winnerPlayerLeft, 490, 200, 325, 120); 
        } else {
          image(winnerPlayerRight, 490, 200, 325, 120);
        }
      }
      break;
    }
  }

  void displayManna() {
    if (frameCount % 60 == 0) {
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
        println("Player 1 health: " + fighterLeft.getHealth());
        if (fighterLeft.getHealth()<=0) {
          gameMenuPage = 1;
          winner = 2;
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
        println("Player 2 health: " + fighterRight.getHealth());
        if (fighterRight.getHealth()<=0) {
          gameMenuPage = 1;
          winner = 1;
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
        if (fighterLeft.skills.get(1).getEnergyCost()<fighterLeft.getManna()+1) {
          fighterLeft.shootBasic();
        }
        break;
      case 'd':
        if (fighterLeft.skills.get(3).getEnergyCost()<fighterLeft.getManna()+1) {
          fighterLeft.shootSpecial();
        }
        break;
      case 'w':
        if (fighterLeft.skills.get(4).getEnergyCost()<fighterLeft.getManna()+1) {
          fighterLeft.shootSpecial(fighterLeft.skills.get(4).getAspect());
        }
        break;

        //Player in the left side
      case 'l':
        fighterRight.changeDirec();
        break;
      case 'k':
        if (fighterRight.skills.get(1).getEnergyCost()<fighterRight.getManna()+1) {
          fighterRight.shootBasic();
        }

        break;
      case 'j':
        if (fighterRight.skills.get(3).getEnergyCost()<fighterRight.getManna()+1) {
          fighterRight.shootSpecial();
        }
        break;
      case 'i':
        if (fighterRight.skills.get(4).getEnergyCost()<fighterRight.getManna()+1) {
          fighterRight.shootSpecial(fighterRight.skills.get(4).getAspect());
        }

        break;
      }
      break;
    case 1:
      gameMenuPage=0;
      fighterLeft = null;
      fighterRight = null;
      setupMenu.runSetupMenu(setupMenuPage);
      break;

    case 2:
      gameMenuPage=0;
      fighterLeft = null;
      fighterRight = null;
      setupMenu.runSetupMenu(setupMenuPage);
      break;
    }
  }
}
