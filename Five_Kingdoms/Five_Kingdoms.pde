PImage fondotemplo,kris_aspc,kris_daga,kris_hondadefuego,kris_con_escudo,daga_aspc;
habilidad_proyectil daga;
luchador kris;
void setup(){
    fondotemplo = loadImage("imagenes/fondotemplo.jpg");
    kris_aspc = loadImage("imagenes/kris.png");
    kris_daga = loadImage("imagenes/daga.png");
    kris_hondadefuego = loadImage("imagenes/honda de fuego.png");
    kris_con_escudo = loadImage("imagenes/kris_con_escudo.png");
    daga_aspc = loadImage("imagenes/daga.png");
    PVector krisvel = new PVector(0,7);
    PVector kristamano = new PVector(250/1.55, 250/1.55);
    PVector krisposi = new PVector(50,height/2-kristamano.y);
    kris= new luchador("kris", kris_aspc, 150, 25, krisvel, krisposi, kristamano);
    PVector dagavel = new PVector(15,0);
    PVector dagatamano = new PVector(250/1.55, 250/1.55);
    PVector dagaposi = new PVector(0,0);
    daga= new habilidad_proyectil ("daga", daga_aspc, 5, 1, dagavel, dagaposi, dagatamano);
    size(1400,850);
}
public void draw(){
    background(0);
    kris.move();
    kris.display();
    kris.vida();
    daga.move();
    daga.display();
  
}
