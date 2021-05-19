class GameMenu {
  private int maxEnergy = 25;
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
        fighterLeft = new Fighter ("kris", 150, 3, new PVector(0, 7), new PVector(50, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspect);
        fighterRight = new Fighter ("kris", 150, 3, new PVector(0, 7), new PVector(1100, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspectRight, true);
        fighterLeft.setBasicSkill(new BasicSkill("daga", 5, 3, new PVector(20, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), krisBasicDaga));
        fighterRight.setBasicSkill(new BasicSkill("daga", 5, 3, new PVector(-20, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), krisBasicDagaRight));
      }
      mainMenuButton1.display();
      fighterRight.init();
      fighterLeft.init();
      break;
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
