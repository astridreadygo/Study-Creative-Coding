float x=1;
float y=2;
void setup(){
size(500,500);
strokeWeight(3);
}

void cir(){
//ellipseMode(CENTER);  
stroke(#ffffff);
fill(#ff0000,70);
rect(mouseX,mouseY,width/2,height/2);
fill(#ffff00,70);
rect((width-mouseX),(height-mouseY),height/2,width/2);

}

void rail(){
for(int i=0;i<width+1;i++){
rect(mouseX,0,100,height);

fill(#0000ff,70);}

fill(#000000,70);//}
rect(0,(height-mouseY),width,100);
}

void draw(){
   rail();
  cir();
 saveFrame();
}
