public ArrayList<Button> mainMenuButtons, setupMenuButtons, gameMenuButtons;
public PImage mouse, title, mainMenuBack, start, start2, instrucciones, instrucciones2, creditos, creditos2, retroceder, retroceder2, krisAspect, krisAspectRight, krisBasicDaga, krisBasicDagaRight, name_kris, shield_Kris,fire_wave_kris_p2,fire_wave_kris,vs;
public PImage[] gameMenuBack = new PImage[5];

public class Data {
  public Data() {    
    //General
    mouse = loadImage("data/mouse.png");
    cursor(mouse, mouseX, mouseY);

    //Data mainMenu
    title = loadImage("data/titulo.png");
    mainMenuBack = loadImage("data/mainBack.png");
    start = loadImage("data/empezar.png");
    start2 = loadImage("data/empezar2.png");
    instrucciones = loadImage("data/instrucciones.png");
    instrucciones2 = loadImage("data/instrucciones2.png");
    creditos = loadImage("data/creditos.png");
    creditos2 = loadImage("data/creditos2.png");
    retroceder = loadImage("data/retroceso.png");
    retroceder2 = loadImage("data/retroceso2.png");
    mainMenuButtons = new ArrayList<Button>();
    mainMenuButtons.add(new Button("", 20, width/2, height/2, 325, 150, title, title));
    mainMenuButtons.add(new Button("", 20, width/2, height/2, 325, 150, title, title));
    //mainMenuButtons.add(new Button("", 20, width/2, height/2, 325, 150, retroceder, retroceder2));
    mainMenuButtons.add(new Button("", 20, 100, height-50, 150, 75, instrucciones, instrucciones2));
    mainMenuButtons.add(new Button("", 20, 1240, height-55, 100, 100, creditos, creditos2));

    //Data setupMenu
    name_kris=loadImage("data/name_kris.png");
    shield_Kris=loadImage("data/escudo.png");
    setupMenuButtons = new ArrayList<Button>();
    setupMenuButtons.add(new Button("", 20, width/2, height/2, 150, 250, start, start2));
    fire_wave_kris=loadImage("data/ondadefuego.png");
    fire_wave_kris_p2=loadImage("data/ondadefuego_p2.png");
    
    //Data gameMenu
    gameMenuButtons = new ArrayList<Button>();
    gameMenuButtons.add(new Button("Continuar", 20, width/2, height/2, 150, 250, start, start2));
    gameMenuBack[0] = loadImage("data/gameBack1.png");
    krisAspect = loadImage("data/kris.png");
    krisAspectRight = loadImage("data/kris_p2.png");
    krisBasicDaga = loadImage("data/kris_basico_daga.png");
    krisBasicDagaRight = loadImage("data/kris_basico_daga_p2.png");
  }
}
