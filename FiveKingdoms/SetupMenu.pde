class SetupMenu {

  SetupMenu() {
  }

  void runSetupMenu(int setupMenuPage) {
    switch (setupMenuPage) {
    case 0:
      background(146, 178, 0);
      mainMenuButton2.display();
      image(name_kris,60,-10,150,150);
      image(name_kris,1100,-10,150,150);
      image(krisAspect,0,height/2-250,300,300);
      image(krisAspectRight,1000,height/2-250,300,300);
      image(krisBasicDaga,-50,height/2-100,300,300);
      image(krisBasicDagaRight,1050,height/2-100,300,300);
      image(shield_Kris,30,height/2+60,150,150);
      image(shield_Kris,1120,height/2+60,150,150);
      break;
    }
  }
}
