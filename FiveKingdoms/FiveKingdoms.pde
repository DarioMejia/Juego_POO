Data data;
public int generalPage = 0;
public int mainMenuPage = 0;
public int setupMenuPage = 0;
public int gameMenuPage = 0;
MainMenu mainMenu;
SetupMenu setupMenu;
GameMenu gameMenu;
color colour= color(255, 255, 255);

void setup() {
  size(1300, 700);
  surface.setLocation(CENTER, CENTER);
  data = new Data();
}

void draw() {
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
  }
  gameMenu.runGameMenu(gameMenuPage);
}

//Interactive methods
void mouseMoved() {
  mainMenuButton1.isInside();
}

void mouseClicked() {
  if (mainMenuButton1.isHovering) {
    if (colour==color(255, 255, 255)) {
      colour= color(255, 0, 0);
    } else {
      colour= color(255, 255, 255);
    }
    if (generalPage < 2) {
      generalPage ++;
    } else {
      generalPage = 0;
    }
  }
}

void keyReleased() {
  switch (generalPage) {
  case 2:
    gameMenu.keyReleasedGameMenu();
    break;
  }
}
