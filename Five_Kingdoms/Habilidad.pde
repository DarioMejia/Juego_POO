class habilidad{
 String nombre;
 PImage aspecto;
 int costo, dano;
 float x, y;
 PVector velocidad = new PVector(x,y),  posicion = new PVector(x,y),tamano = new PVector(x,y);
 habilidad(String nombre, PImage aspecto, int dano, int costo, PVector velocidad, PVector posicion, PVector tamano){
    this.nombre = nombre;
    this.aspecto = aspecto;
    this.costo = costo;
    this.dano = dano;
    this.velocidad = velocidad;
    this.posicion = posicion;
    this.tamano = tamano;
 }
}
