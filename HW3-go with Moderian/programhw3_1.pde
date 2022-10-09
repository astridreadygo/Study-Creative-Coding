//float rec_x = 20;
//float rec_y = 20;

//void setup() {
//  size(300, 300);
//  background(255);
//  colorMode(HSB);
//  frameRate(1);
//  //int Y = posY;
  
//   for (int i = 0; i < width/20; i ++) {
//     noStroke();
//    //for (int j = 0; j < 8; j ++) {
//      fill(100, 50,120*random(3),100);
//      rect(random(0,width/2),i*50,random(0,width),random(i*20));
     
//}

//   }
//方格画
//   //void draw(){
////      for (int i = 0; i < width/20; i ++) {
////     noStroke();
////    //for (int j = 0; j < 8; j ++) {
////      fill(100, 50,120*random(3),100);
////      rect(random(0,rec_x),rec_y*50,random(0,width),random(i*20));
////     rec_x = rec_x +2;

////}
////   }

//int bgWidth = 500;
//int bgHeight = 500;
//float lineSize = 0;
//float colSize = 0;

//color[] colors = {#ffffff, #ff0000, #ffff00, #0000ff, #000000};
////Define the fill color

//void mondrianStyle() {
//  for(int line = 0; line < bgHeight; line += lineSize + 3) {
//    lineSize = random(4, bgWidth/3);
//    for(int col = 0; col < bgWidth; col += colSize + 3) {
//      colSize = random(4, bgHeight/2);
// // Define the color block size  

//      color rectColor = colors[int(random(colors.length))];
//      fill(rectColor);
//      rect(col, line, colSize, lineSize);
//      //Drawing color blocks

//      strokeWeight(3);
//      stroke(#000000);
//      float x = col+colSize;
//      float y = line+lineSize;
//      line(0, y, bgWidth, y);
//      line(x, line, x, y);
//      //Drawing Black lines
//    }
//  }
//}

//void setup() {
//  size(500,500);
//  background(#ffffff);
//  mondrianStyle(); 
//  //First run
//}

//void draw() {
//  if (mousePressed){
//        mondrianStyle();
//         //save("mondarian.tif");
//  }
////Regenerate when the mouse is clicked
//}

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
  // sometimes we decide to change the line color
  if (random(100) > 70) {
    
    // now we decide if to use black or white
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
  
  line(y, 100, random(y), 150);
  y = y + 0.5;

  if (y > width) {
    y = 0;
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
