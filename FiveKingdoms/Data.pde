public Button mainMenuButton1, mainMenuButton2;
public PImage mouse, mainMenuBack, krisAspect, krisAspectRight, krisBasicDaga, krisBasicDagaRight;
public PImage[] gameMenuBack = new PImage[5];

public class Data {
  public Data() {    
    //General
    mouse = loadImage("imagenes/mouse.png");
    cursor(mouse, mouseX, mouseY);
    
    //Data mainMenu
    mainMenuBack = loadImage("imagenes/mainBack.png");
    mainMenuButton1 = new Button("Hola", 20, width/2, height/2, 100, 50);
    
    //Data setupMenu
    
    //Data gameMenu
    gameMenuBack[0] = loadImage("imagenes/gameBack1.jpg");
    krisAspect = loadImage("imagenes/kris.png");
    krisAspectRight = loadImage("imagenes/kris_p2.png");
    krisBasicDaga = loadImage("imagenes/kris_basico_daga.png");
    krisBasicDagaRight = loadImage("imagenes/kris_basico_daga_p2.png");
  }
}
