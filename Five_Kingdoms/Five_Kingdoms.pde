PImage fondotemplo,kris_aspc,kris_daga,kris_hondadefuego;
luchador kris;
void setup(){
    fondotemplo=loadImage("imagenes/fondotemplo.jpg");
     kris_aspc=loadImage("imagenes/kris.png");
    kris_daga=loadImage("imagenes/daga.png");
    kris_hondadefuego=loadImage("imagenes/honda de fuego.png");
    PVector krisposi =new PVector(150,150);
    PVector krisvel =new PVector(0,13);
    PVector kristamano =new PVector(250,300);
    kris= new luchador("kris",kris_aspc,150,25,krisvel,krisposi, kristamano);
    size(1400,850);
    
}
public void draw(){
  background(0);
  kris.move();
  kris.display();
}
