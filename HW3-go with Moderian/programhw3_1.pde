float x = 0;
float y = 0;
float z=0;
void setup() {
  size(400, 400);
  background(255);
  stroke(#ffffff);
}

void draw() {
  line(x, 50, x,70);
  x = x + 1;
  if (x > width) {
    x = 0;
  }
  if (random(100) > 70) {

    if (random(100) > 50) {
      stroke(#ff0000);
    } 
    else {
     if (random(100) > 50) {
      stroke(#ffff00);
    } 
    else{
      stroke(#000000);
    }
    }
    //#ffffff, #ff0000, #ffff00, #0000ff, #000000
  }
  // I got idea of the first line above from website (https://funprogramming.org/18-Things-that-happen-sometimes.html)
  // The next two lines is also a imitation of the first one.
  
  //line 2:
  line(y, 100, random(y), 150);
  y = y + 0.5;

  if (y > width) {
    y = 0;
  }
 
  if (random(100) > 70) {
  
    if (random(100) > 50) {
      stroke(#ff0000);
    } 
    else {
     if (random(100) > 50) {
      stroke( #0000ff);
    } 
    else{
      stroke(#000000);
    }
    }
}

//line 3:
 line(200, 300, random(z), random(200,350));
  z = z + 2;

  if (z > width) {
    z = 0;
  }
  // sometimes we decide to change the line color
  if (random(100) > 70) {
    
    // now we decide if to use black or white
    if (random(100) > 50) {
      stroke(#ff0000);
    } 
    else {
     if (random(100) > 50) {
      stroke( #0000ff);
    } 
    else{
      stroke(#000000);
    }
    }
}
saveFrame();
}
