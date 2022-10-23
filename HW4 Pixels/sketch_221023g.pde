PImage img;
Particle [] p;
float s;
int pColor = 0;

void setup(){
size(600,480);
smooth();
p = new Particle[100]; 
noStroke();
frameRate(1000);
img = loadImage("colorBrushes.png");
img.resize(width, height);
for (int i =0; i<p.length;i++){
p[i]=new Particle();
}
background(255);
}

void draw(){

//for (int y = 0; y < img.height; y+=0.1 ) {
//for (int x = 0; x < img.width; x+=0.1) {
  for (int i =0; i<p.length;i++){
   int xx = (int)random(width);
   int yy = (int)random(height);
   color fc = img.get(xx, yy);
//int loc = x + (y * img.width);
//PImage pColor = img.get(xx, yy);
rotate(PI);
 float t0 = map(i, 0, p.length-1, 0, PI); 
 float t1 = t0 + (TWO_PI/(2*p.length));       
p[i].Particlepaint(xx,yy,fc,t0,t1);
//p[i].pump();
     
}
  }
