Data data;
public int generalPage = 0;
public int mainMenuPage = 0;
public int setupMenuPage = 0;
public int gameMenuPage = 0;
MainMenu mainMenu;
SetupMenu setupMenu;
GameMenu gameMenu;

void setup() {
  size(1300, 700, P3D);
  data = new Data();
}

void draw() {
  cursor(ARROW);
  //frameRate(60);
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
    switch(mainMenuPage) {
    case 0:
      for (int i = 0; i < 2; i++) {
        mainMenuButtons.get(i).mouseClickedButton();
      }
      if (mainMenuButtons.get(0).isInside()) {
        generalPage++;
      }

      if (mainMenuButtons.get(1).isInside()) {
        mainMenuPage = 1;
      }

      if (mainMenuButtons.get(2).isInside()) {
        mainMenuPage = 2;
      }
      break;
    case 1:
    case 2:
      mainMenuButtons.get(3).mouseClickedButton();
      if (mainMenuButtons.get(3).isInside()) {
        mainMenuPage = 0;
      }
      break;
    }
    break;

  case 1:
    switch(setupMenuPage) {
    case 0:
      for (int i = 0; i < 2; i++) {
        setupMenuButtons.get(i).mouseClickedButton();
      }

      if (setupMenuButtons.get(0).isInside()) {
        generalPage++;
      }

      if (setupMenuButtons.get(1).isInside()) {
        generalPage--;
      }
      break;
    }
    break;

  case 2:
    switch(gameMenuPage) {
    case 0:
      gameMenuButtons.get(0).mouseClickedButton();

      if (gameMenuButtons.get(0).isInside()) {
        gameMenuPage++;
      }
      break;

    case 1:
      for (int i = 1; i < 4; i++) {
        gameMenuButtons.get(i).mouseClickedButton();
      }

      if (gameMenuButtons.get(1).isInside()) {
        gameMenuPage = 0;
      }

      if (gameMenuButtons.get(2).isInside()) {
        generalPage--;
        gameMenuPage = 0;
        gameMenu.setFighterLeft(null);
        gameMenu.setFighterRight(null);
      }

      if (gameMenuButtons.get(3).isInside()) {
        gameMenu.setFighterLeft(null);
        gameMenu.setFighterRight(null);
        gameMenuPage = 0;
        gameMenu.runGameMenu(gameMenuPage);
      }

      break;
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
