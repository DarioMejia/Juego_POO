class GameMenu {
  private int maxEnergy = 25;
  int energyFighterLeft, energyFighterRight;
  boolean location;
  Fighter fighterLeft, fighterRight;

  GameMenu() {
  }

  void runGameMenu(int gameMenuPage) {
    switch (gameMenuPage) {
    case 0:
      if (fighterLeft == null && fighterRight == null) {
        fighterLeft = new Fighter ("kris", 150, new PVector(0, 7), new PVector(50, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspect);
        fighterRight = new Fighter ("kris", 150, new PVector(0, 7), new PVector(1100, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspect, true);
      }
      if (fighterLeft.skills == null && fighterRight == null) {
        fighterLeft.skills.add(new BasicSkill("daga", 5, 3, new PVector(15, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), krisBasicDaga));
        fighterRight.skills.add(new BasicSkill("daga", 5, 3, new PVector(15, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), krisBasicDaga));
      }
      background(255, 204, 0);
      mainMenuButton1.display();
      fighterRight.move();
      fighterRight.display();
      fighterLeft.move();
      fighterLeft.display();
      break;
    }
  }
  
  void keyReleasedGameMenu(){
    if (gameMenuPage == 0){
      switch (key){
        case 'a':
        fighterLeft.changeDirec();
        break;
        case 'l':
        fighterRight.changeDirec();
        break;
      }
    }
    
  }
}
