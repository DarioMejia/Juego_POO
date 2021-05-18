class Button {
  
  boolean isHovering;
  String txt;
  float txtSize, posX, posY, w, h;

  Button(String txt, float txtSize, float posX, float posY, float w, float h) {
    this.txt= txt;
    this.txtSize= txtSize;
    this.posX= posX;
    this.posY= posY;
    this.w= w;
    this.h= h;
  }

  void display() {
    //Dibuja el botón
    rectMode(CENTER);
    fill(isHovering? color(0, 0, 0) : color(105, 105, 105));
    stroke(0);


    strokeWeight(4);
    rect(posX, posY, w, h);

    //Dibuja el texto del botón
    textAlign(CENTER);
    textSize(txtSize);
    fill(255);
    if (height>=720) {
      text(txt, posX, posY+7/((0+height)/720));
    } else {
      text(txt, posX, posY+7);
    }
  }
  //Verifica si el cursor esta dentro del boton
  boolean isInside() {
    return isHovering = mouseX > (posX-w/2)*width/width & mouseX < (posX+w/2)*width/width &
      mouseY > (posY-h/2)*height/height & mouseY < (posY+h/2)*height/height;
  }
}
