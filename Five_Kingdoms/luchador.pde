class luchador{
  String nombre;
  PImage aspecto;
  int vida,energia=25;
  float sec=map(second(),0,60,0,width);
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
  sec=0;
   }
  void move(){
    posicion.add(velocidad);
    if (posicion.y>height- tamano.y){
      posicion.y=height- tamano.y-10;
      velocidad.y =velocidad.y*-1;
    }else if (posicion.y<0){
      posicion.y=10;
      velocidad.y =velocidad.y*-1;
    }
    
  }
  void cambiardirec(){
    
     velocidad.y =velocidad.y*-1;
    delay(100);
  }
  void recarga_de_energia(){
    noStroke();
  fill(sec/3,0,sec/3);
  rect(0,0,sec,height/3);
  stroke(255);
  line (sec,0,sec,height/3);
      
  }
  
  void perder_vida(){
    //vida=vida-daño;
  }
  void vida(){
  for (int i = 1;i<vida;i++){
      rect (2.5*i,2.5,2.5,25);
    }
  }
  void display(){
  image(this.aspecto,posicion.x,posicion.y ,this.tamano.x,this.tamano.y);
  }
}
