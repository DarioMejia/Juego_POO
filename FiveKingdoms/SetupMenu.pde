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
      image(fighter1Name, 250, 50, 150, 150);
      image(fighter1Name, 910, 50, 150, 150);
      image(fighter1, 250, height/2-185, 150, 150);
      image(fighter12, 900, height/2-185, 150, 150);
      image(fighter1Basic, 230, height/2-100, 150, 150);
      image(fighter12Basic, 915, height/2-100, 150, 150);
      image(fighter1Special1, 230, height/2-30, 200, 350);
      image(fighter12Special1, 860, height/2-30, 200, 350);
      image(shield, 230, height/2+120, 150, 150);
      image(shield, 910, height/2+120, 150, 150);
      image(fight,width/2-100, height/2-150,200,200);
      break;
    }
  }
}
