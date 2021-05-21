class Button {

  private boolean state;
  boolean isHovering;
  String txt;
  float txtSize, posX, posY, w, h;
  PImage aspect, aspectClicked;

  Button(String txt, float txtSize, float posX, float posY, float w, float h, PImage aspect, PImage aspectClicked) {
    this.txt= txt;
    this.txtSize= txtSize;
    this.posX= posX;
    this.posY= posY;
    this.w= w;
    this.h= h;
    this.aspect = aspect;
    this.aspectClicked = aspectClicked;
  }

  void display() {
    //Dibuja el botón
    imageMode(CENTER);
    if (isHovering) {
      image(aspectClicked, posX, posY, w, h);
      cursor(HAND);
    } else {
      image(aspect, posX, posY, w, h);
    }
    if (state) {
      image(aspectClicked, posX, posY, w, h);
      cursor(HAND);
      state = false;
    }
    imageMode(CORNER);

    //Dibuja el texto del botón
    textAlign(CENTER);
    textSize(txtSize);
    fill(255);
    if (height>=700) {
      text(txt, posX, posY+7/((0+height)/700));
    } else {
      text(txt, posX, posY+7);
    }
  }

  void mouseClickedButton() {
    if (isHovering) {
      this.state = true;
      this.display();
    }
  }

  //Verifica si el cursor esta dentro del boton
  boolean isInside() {
    return isHovering = mouseX > (posX-w/2)*width/width & mouseX < (posX+w/2)*width/width &
      mouseY > (posY-h/2)*height/height & mouseY < (posY+h/2)*height/height;
  }
}
