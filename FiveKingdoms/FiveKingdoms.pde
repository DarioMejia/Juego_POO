Data data;
public int generalPage = 0;
public int mainMenuPage = 0;
public int setupMenuPage = 0;
public int gameMenuPage = 0;
MainMenu mainMenu;
SetupMenu setupMenu;
GameMenu gameMenu;

void setup() {
  size(1300, 700);
  surface.setLocation(CENTER, CENTER);
  data = new Data();
}

void draw() {
  frameRate(600);
  switch(generalPage) {
  case 0:
    mainMenu();
    break;
  case 1:
    setupMenu();
    break;
  case 2:
    gameMenu();
    break;
  }
}

void mainMenu() {
  if (mainMenu == null) {
    mainMenu = new MainMenu();
  }
  mainMenu.runMainMenu(mainMenuPage);
}

void setupMenu() {
  if (setupMenu == null) {
    setupMenu = new SetupMenu();
  }
  setupMenu.runSetupMenu(setupMenuPage);
}

void gameMenu() {
  if (gameMenu == null) {
    gameMenu = new GameMenu();
    gameMenu.runGameMenu(gameMenuPage);
  }
  gameMenu.runGameMenu(gameMenuPage);
}

//Interactive methods
void mouseMoved() {
  switch(generalPage) {
  case 0:
    for (Button button : mainMenuButtons) {
      button.isInside();
    }
    break;
  case 1:
    for (Button button : setupMenuButtons) {
      button.isInside();
    }
    break;
  case 2:
    for (Button button : gameMenuButtons) {
      button.isInside();
    }
    break;
  }
}

void mouseClicked() {
  switch(generalPage) {
  case 0:
    for (Button button : mainMenuButtons) {
      button.mouseClickedButton();
    }

    if (mainMenuButtons.get(0).isInside()) {
      if (generalPage < 3) {
        generalPage++;
      }
    }
    
    if (mainMenuButtons.get(1).isInside()) {
      mainMenuPage = 1;
    }
    
    if (mainMenuButtons.get(2).isInside()) {
      mainMenuPage = 2;
    }

    if (mainMenuButtons.get(3).isInside()) {
      mainMenuPage--;
    }
    break;
  case 1:
    for (Button button : setupMenuButtons) {
      button.mouseClickedButton();
    }

    if (mainMenuButtons.get(0).isInside()) {
      if (generalPage < 3) {
        generalPage++;
      }
    }
    break;
  case 2:
    for (Button button : gameMenuButtons) {
      button.mouseClickedButton();
    }
    break;
  }
}

void keyReleased() {
  switch (generalPage) {
  case 0:
    break;
  case 1:
    break;
  case 2:
    gameMenu.keyReleasedGameMenu();
    break;
  }
}
