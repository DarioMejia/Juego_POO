class SetupMenu {
  SetupMenu() {
  }

  void runSetupMenu(int setupMenuPage) {
    switch (setupMenuPage) {
    case 0:
      image(setupMenuBackground, 0, 0, width, height);
      for (int i = 0; i < 2; i++) {
        setupMenuButtons.get(i).display();
      }
      image(fighter1Name, 60, -10, 150, 150);
      image(fighter1Name, 1100, -10, 150, 150);
      image(fighter1, 0, height/2-250, 150, 150);
      image(fighter12, 1000, height/2-250, 150, 150);
      image(fighter1Basic, -50, height/2-100, 150, 150);
      image(fighter12Basic, 1050, height/2-100, 150, 150);
      image(fighter1Special1, -10, height/2+140, 150, 185);
      image(fighter12Special1, 1010, height/2+140, 150, 185);
      image(shield, 30, height/2+60, 150, 150);
      image(shield, 1120, height/2+60, 150, 150);
      break;
    }
  }
}
