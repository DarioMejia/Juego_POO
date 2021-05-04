int time=10;
int x =0,y,q;
void setup(){
size(1000,1000);
background(0);
}
//void keyReleased(){
//if (key=='0'){
//  lostime=0;
//x=x-1;
//lostime=lostime-1;
//}
//}
void draw(){
background(0);
  int lostime=second();

if (lostime<time){
  x=x+lostime;
  y=x*2;
  
}


text(""+x,height/2, width/2);
text(""+lostime,(height/2)+200, (width/2)+200);
text(""+y,(height/2)+250, (width/2)+250);
}
