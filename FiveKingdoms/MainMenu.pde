class MainMenu {

  MainMenu() {
  }

  void runMainMenu(int mainMenuPage) {
    switch (mainMenuPage) {
    case 0:
      image(mainMenuBack, 0, 0, width, height);
      image(title, width/3, height/3, 400, 150);
      mainMenuButton1.display();
      break;
    }
  }
}
