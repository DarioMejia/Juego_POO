public ArrayList<Button> mainMenuButtons, setupMenuButtons, gameMenuButtons;
public PImage mouse, title, title2, returnButton, returnButton2, instructions, instructions2, credits, credits2, mainMenuBackground, instructionsBackground, setupMenuBackground, start, start2, fighter1, fighter1Name, fighter1Basic, fighter1Special1, fighter1Special2, shield, fighter1Animation, fighter12, fighter12Basic, fighter12Special1, fighter12Special2, fighter12Animation, fighter2, fighter2Name, fighter2Basic, fighter2Special1, fighter2Special2, fighter2Animation, fighter22, fighter22Basic, fighter22Special1, fighter22Special2, fighter22Animation, fighter3, fighter3Name, fighter3Basic, fighter3Special1, fighter3Special2, fighter3Animation, fighter32, fighter32Basic, fighter32Special1, fighter32Special2, fighter32Animation;
public PImage[] gameMenuBack = new PImage[5];

public class Data {
  public Data() {    
    //General
    returnButton = loadImage("data/return.png");
    returnButton2 = loadImage("data/return2.png");

    //Data mainMenu
    mainMenuBackground = loadImage("data/background1.png");
    instructionsBackground = loadImage("data/background12.png");
    title = loadImage("data/title.png");
    title2 = loadImage("data/title2.png");
    start = loadImage("data/start.png");
    start2 = loadImage("data/start2.png");
    instructions = loadImage("data/instructions.png");
    instructions2 = loadImage("data/instructions2.png");
    credits = loadImage("data/credits.png");
    credits2 = loadImage("data/credits2.png");
    mainMenuButtons = new ArrayList<Button>();
    mainMenuButtons.add(new Button("", 20, width/2, height/2, 335, 150, title, title2));
    mainMenuButtons.add(new Button("", 20, 100, height-50, 150, 75, instructions, instructions2));
    mainMenuButtons.add(new Button("", 20, 1240, height-55, 100, 100, credits, credits2));
    mainMenuButtons.add(new Button("", 20, 65, height-35, 75, 50, returnButton, returnButton2));

    //Data setupMenu
    setupMenuBackground = loadImage("data/background2.jpg");
    shield = loadImage("data/shield.png");
    setupMenuButtons = new ArrayList<Button>();
    setupMenuButtons.add(new Button("", 20, 1240, height-65, 100, 110, start, start2));

    //Data gameMenu
    gameMenuButtons = new ArrayList<Button>();
    gameMenuButtons.add(new Button("Continuar", 20, width/2, height/2, 150, 250, start, start2));
    gameMenuBack[0] = loadImage("data/background3.png");
    gameMenuBack[1] = loadImage("data/background32.png");

    //Fighters data
    //Init Kris-right and Kris-left 
    fighter1 = loadImage("data/fighter1.png");
    fighter1Name= loadImage("data/fighter1_name.png");
    fighter1Animation = loadImage("data/fighter1_animation.png");
    fighter1Basic = loadImage("data/fighter1_basic.png");
    fighter1Special1 = loadImage("data/fighter1_special1.png");
    fighter1Special2 = loadImage("data/fighter1_special2.png");
    fighter12 = loadImage("data/fighter12.png");
    fighter12Animation = loadImage("data/fighter12_animation.png");
    fighter12Basic = loadImage("data/fighter12_basic.png");
    fighter12Special1 = loadImage("data/fighter12_special1.png");
    fighter12Special2 = loadImage("data/fighter12_special2.png");
    //Init Marcus-right and Marcus-left
    fighter2 = loadImage("data/fighter2.png");
    //fighter2Name= loadImage("data/fighter2_name.png");
    fighter2Basic = loadImage("data/fighter2_basic.png");
    fighter2Special1 = loadImage("data/fighter2_special1.png");
    fighter2Special2 = loadImage("data/fighter2_special2.png");
    fighter22 = loadImage("data/fighter22.png");
    fighter22Basic = loadImage("data/fighter22_basic.png");
    fighter22Special1 = loadImage("data/fighter22_special1.png");
    fighter22Special2 = loadImage("data/fighter22_special2.png");
    //Init Mike-right and Mike-left
    fighter3 = loadImage("data/fighter3.png");
    //fighter3Name= loadImage("data/fighter3_name.png");
    fighter3Animation = loadImage("data/fighter3_animation.png");
    fighter3Basic = loadImage("data/fighter3_basic.png");
    fighter3Special1 = loadImage("data/fighter3_special1.png");
    fighter3Special2 = loadImage("data/fighter3_special2.png");
    fighter32 = loadImage("data/fighter32.png");
    fighter32Animation = loadImage("data/fighter32_animation.png");
    fighter32Basic = loadImage("data/fighter32_basic.png");
    fighter32Special1 = loadImage("data/fighter32_special1.png");
    fighter32Special2 = loadImage("data/fighter32_special2.png");
  }
}
