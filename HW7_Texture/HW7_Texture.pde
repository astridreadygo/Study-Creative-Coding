void setup() {
  size(550, 400);
  smooth();
    background(255);
  //textSize(20);
}
void draw() {
pushMatrix();
  translate(width/2, height);
  texture(map(frameCount*10,0,width,20,150));
popMatrix();//CHANGE THE AXIS TEMPORARILY
}
void texture(float m) {   
stroke(30,50+frameCount/3,30+frameCount);
//triangle(50,50, 0, -m,6,6);
// rect(0, 0, 0, -len,60);
ellipse(0, 0, 6, m);//BASIC ELEMENTS OF THE TEXTURE:ELLIPSE

  translate(0, -m);
  m *= 0.65;
  float theta = map(mouseX, 0, height, 0, PI);
  if (m > 10) {
    pushMatrix();
    rotate(theta);
    texture(m);       // call myself to draw new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    texture(m);
    popMatrix();
  }
 saveFrame();
}
