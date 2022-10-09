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
//fill(#0000ff);
//ellipse((width-mouseX)*2/3,(height-mouseY)*2/3,50,50);
//x=x+mouseY;
//y=y+mouseX;
}

void rail(){
for(int i=0;i<width+1;i++){
rect(mouseX,0,100,height);
//if (random(100)>50) {  
fill(#0000ff,70);}

//else{
fill(#000000,70);//}
rect(0,(height-mouseY),width,100);
}
//}

void draw(){
   rail();
  cir();
 saveFrame();
}
