public Button mainMenuButton1, mainMenuButton2;
public PImage mouse, title, mainMenuBack, start, start2, krisAspect, krisAspectRight, krisBasicDaga, krisBasicDagaRight,name_kris,shield_Kris,fire_wave_kris_p2,fire_wave_kris,vs;
public PImage[] gameMenuBack = new PImage[5];

public class Data {
  public Data() {    
    //General
    mouse = loadImage("imagenes/mouse.png");
    cursor(mouse, mouseX, mouseY);
    
    //Data mainMenu
    title = loadImage("imagenes/titulo.png");
    mainMenuBack = loadImage("imagenes/mainBack.png");
    start = loadImage("imagenes/empezar.png");
    start2 = loadImage("imagenes/empezar2.png");
    mainMenuButton1 = new Button("", 20, width/2, height/2, 400, 250, title, title);
    mainMenuButton2 = new Button("Continuar", 20, width/2, height/2, 150, 250, start, start2);
    
    //Data setupMenu
    name_kris=loadImage("imagenes/name_kris.png");
    shield_Kris=loadImage("imagenes/escudo.png");
    fire_wave_kris=loadImage("imagenes/ondadefuego.png");
    fire_wave_kris_p2=loadImage("imagenes/ondadefuego_p2.png");
    //Data gameMenu
    gameMenuBack[0] = loadImage("imagenes/gameBack1.png");
    krisAspect = loadImage("imagenes/kris.png");
    krisAspectRight = loadImage("imagenes/kris_p2.png");
    krisBasicDaga = loadImage("imagenes/kris_basico_daga.png");
    krisBasicDagaRight = loadImage("imagenes/kris_basico_daga_p2.png");
    vs=loadImage("imagenes/vs.png");
  }
}
