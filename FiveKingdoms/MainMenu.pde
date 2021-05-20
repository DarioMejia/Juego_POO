class MainMenu {
  String crawl;
  float textY;
  MainMenu() {
    crawl = "";
  }

  void runMainMenu(int mainMenuPage) {
    switch (mainMenuPage) {
    case 0:
      image(mainMenuBack, 0, 0, width, height);
      for (Button button : mainMenuButtons) {
        button.display();
      }
      break;
    case 1:
      instructions();
      break;
    }
  }

  void instructions() {
    if (crawl == "") {
      crawl = "        Five Kingdoms\n\n       POO\n\n       Diseñadores\n\n       Edward Morales\n       Santiago Carbal\n\n       Programadores\n\n       Dario Mejia\n       Michelle Polo\n\n\n\n       'Alejandro Salas'";
    }

    background(0);
    fill(255, 255, 0);
    translate(0, height);
    textSize(80);
    text(crawl, 0, textY, 1100, 3600);
    textY -= 1;
  }
}
