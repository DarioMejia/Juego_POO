public Button mainMenuButton1, mainMenuButton2;
public PImage krisAspect, krisBasicDaga;

public class Data {
  public Data() {    
    //Data mainMenu
    mainMenuButton1 = new Button("Hola", 20, width/2, height/2, 100, 50);
    
    //Data setupMenu
    
    //Data gameMenu
    krisAspect = loadImage("imagenes/kris.png");
    krisBasicDaga = loadImage("imagenes/kris_basico_daga.png");
  }
}
