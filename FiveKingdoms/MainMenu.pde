class MainMenu {

  MainMenu() {
  }

  void runMainMenu(int mainMenuPage) {
    switch (mainMenuPage) {
    case 0:
      image(mainMenuBack, 0, 0, width, height);
      mainMenuButton1.display();
      break;
    }
  }
}
