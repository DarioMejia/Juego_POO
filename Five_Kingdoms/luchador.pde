class luchador{
  String nombre;
  PImage aspecto;
  int vida,energia=25,sec=second();
  float velx,vely,x,y,xtam,ytam;
  PVector velocidad=new PVector(velx,vely),  posicion=new PVector(x,y),tamano=new PVector(xtam,ytam);
  luchador(String nombre,PImage aspecto,int vida,int energia,PVector velocidad,  PVector posicion,PVector tamano){
  this.nombre=nombre;
  this.aspecto=aspecto;
  this.vida=vida;
  this.energia=energia;
  this.velocidad=velocidad;
  this.posicion=posicion;
  this.tamano=tamano;
   }
  void move(){
    posicion.add(velocidad);
    if ((posicion.y>width-tamano.y)||(posicion.y>0)){
      velocidad.y =velocidad.y*-1;
    }
    if (keyPressed==true&& key=='0'){
      velocidad.y =velocidad.y*-1;
    }
  }
  void recarga_de_energia(){
  if(energia<=50){
      energia=energia+(sec*2);
    }
  }
  void perder_vida(){
    //vida=vida-daño;
  }
  void display(){
  image(this.aspecto,posicion.x,height/150,this.tamano.x,this.tamano.y);
  }
}
