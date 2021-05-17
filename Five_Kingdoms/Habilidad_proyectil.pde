class habilidad_proyectil extends habilidad {

  habilidad_proyectil(String nombre, PImage aspecto, int dano, int costo, PVector velocidad, PVector posicion, PVector tamano) {
    super(nombre, aspecto, dano, costo, velocidad, posicion, tamano);
  }

  void tirar() {
    this.posicion.y = kris.posicion.y;
    this.posicion.x = kris.posicion.x;
  }

  void move () {
    this.posicion.x = this.posicion.x+this.velocidad.x;
  }

  void display() {
    if (this.posicion.x > width - this.tamano.x/1.55) {
    } else {
      image(this.aspecto, this.posicion.x, this.posicion.y, this.tamano.x, this.tamano.y);
    }
  }
}
