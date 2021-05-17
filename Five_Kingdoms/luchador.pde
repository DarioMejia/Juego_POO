class luchador {
  String nombre;
  PImage aspecto;
  int vida, energia = 25;
  float sec = map(second(), 0, 60, 0, width);
  float x, y;
  PVector velocidad = new PVector(x, y), posicion = new PVector(x, y), tamano = new PVector(x, y);
  luchador(String nombre, PImage aspecto, int vida, int energia, PVector velocidad, PVector posicion, PVector tamano) {
    this.nombre = nombre;
    this.aspecto = aspecto;
    this.vida = vida;
    this.energia = energia;
    this.velocidad = velocidad;
    this.posicion = posicion;
    this.tamano = tamano;
    sec = 0;
  }
  void move() {
    this.posicion.add(this.velocidad);
    if (this.posicion.y > height - this.tamano.y) {
      this.posicion.y = height - this.tamano.y - 10;
      this.velocidad.y *= -1;
    } else if (this.posicion.y < 0) {
      this.posicion.y = 10;
      cambiardirec();
    }
  }
  void cambiardirec() {
    this.velocidad.y *= -1;
  }
  void recarga_de_energia() {
    noStroke();
    fill(sec/3, 0, sec/3);
    rect(0, 0, sec, height/3);
    stroke(255);
    line (sec, 0, sec, height/3);
  }
  void perder_vida() {
    //vida=vida-daño;
  }
  void vida() {
    for (int i = 1; i < vida; i++) {
      rect (2.5 * i, 2.5, 2.5, 25);
    }
  }
  void display() {
    image(this.aspecto, this.posicion.x, this.posicion.y, this.tamano.x, this.tamano.y);
  }
}
