class MainMenu {
  String crawl;
  float textY;
  Star[] stars = new Star[800];
  float speed;
  MainMenu() {
    crawl = "";
  }

  void runMainMenu(int mainMenuPage) {
    switch (mainMenuPage) {
    case 0:
      image(mainMenuBack, 0, 0, width, height);
      for (int i = 0; i <= 2; i++) {
        mainMenuButtons.get(i).display();
      }
      break;
    case 1:
      image(instruccionesFondo, 0, 0, width, height);
      mainMenuButtons.get(3).display();
      break;
    case 2:
      instructions();
      break;
    }
  }

  void instructions() {
    if (crawl == "") {
      for (int i = 0; i < stars.length; i++) {
        stars[i] = new Star();
      }
      crawl = "        Five Kingdoms\n\n       POO\n\n       Diseñadores\n\n       Edward Morales\n       Santiago Carbal\n\n       Programadores\n\n       Dario Mejia\n       Michelle Polo\n\n\n\n       Alejandro Salas";
    }
    speed = map(15, 0, width, 0, 50);
    background(0);
    mainMenuButtons.get(3).display();
    translate(width/2, height/2);
    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
    fill(255, 255, 0);
    rotateX(PI/3.0);
    translate(0, height);
    textSize(80);
    text(crawl, 300, textY, -800, 3100);
    textY -= 2;
  }

  class Star {
    float x;
    float y;
    float z;
    float pz;

    Star() {
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      z = random(width/2);
      pz = z;
    }

    void update() {
      z = z - speed;
      if (z < 1) {
        z = width/2;
        x = random(-width/2, width/2);
        y = random(-height/2, height/2);
        pz = z;
      }
    }

    void show() {
      fill(255);
      noStroke();

      float sx = map(x / z, 0, 1, 0, width/2);
      float sy = map(y / z, 0, 1, 0, height/2);
      ;

      float r = map(z, 0, width/2, 16, 0);
      ellipse(sx, sy, r, r);

      float px = map(x / pz, 0, 1, 0, width/2);
      float py = map(y / pz, 0, 1, 0, height/2);

      pz = z;
      stroke(255);
      line(px, py, sx, sy);
    }
  }
}
