float x=1;
float y=2;
void setup(){
size(500,300);
strokeCap(ROUND);
strokeWeight(2);
}

void cir(){
//ellipseMode(CENTER);  
stroke(#ffffff);
fill(#ff0000,70);
float a = random(width);
float b = random(height);
ellipse(a,b,random(width/5),random(height/5));  //red
fill(#ffff00,70);  //yellow
ellipse(random(width-mouseX),random(height-mouseY),random(height/5),random(height/5));
fill(#0000ff,70);  //blue
ellipse(width-a,width-b,random(width/3),random(width/3));
fill(#000000,70);  //black
ellipse(a-random(width-mouseX),b-random(height-mouseY),random(height/4),random(width/4));
}

void draw(){cir();
saveFrame();}
