class GameMenu {
  private int maxEnergy = 25;
  int energyFighterLeft, energyFighterRight, numBasicLeft, numBasicRight;
  boolean location;
  Fighter fighterLeft, fighterRight;

  GameMenu() {
    energyFighterLeft = 0; 
    energyFighterRight = 0; 
    numBasicLeft = 0; 
    numBasicRight = 0; 
  }

  void runGameMenu(int gameMenuPage) {
    switch (gameMenuPage) {
    case 0:
      if (fighterLeft == null && fighterRight == null) {
        fighterLeft = new Fighter ("kris", 150, 3, new PVector(0, 7), new PVector(50, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspect);
        fighterRight = new Fighter ("kris", 150, 3, new PVector(0, 7), new PVector(1100, height/2-250/1.55), new PVector(250/1.55, 250/1.55), krisAspect, true);
      }
      if (fighterLeft.skills.size() == 0 && fighterRight.skills.size() == 0) {
        fighterLeft.setBasicSkill(new BasicSkill("daga", 5, 3, new PVector(15, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), krisBasicDaga));
        fighterRight.setBasicSkill(new BasicSkill("daga", 5, 3, new PVector(15, 0), new PVector(0, 0), new PVector(250/1.55, 250/1.55), krisBasicDaga));
      }
      background(255, 204, 0);
      mainMenuButton1.display();
      fighterRight.init();
      fighterLeft.init();
      break;
    }
  }
  
  void keyReleasedGameMenu(){
    if (gameMenuPage == 0){
      switch (key){
        //Player in the left side
        case 'a':
        fighterLeft.changeDirec();
        break;
        case 's':
        fighterLeft.shoot(numBasicLeft);
        break;
        
        //Player in the right side
        case 'l':
        fighterRight.changeDirec();
        break;
      }
    }
    
  }
}
