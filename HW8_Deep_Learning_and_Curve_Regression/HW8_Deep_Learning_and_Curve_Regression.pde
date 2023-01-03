ArrayList<PVector> data = new ArrayList();
float m = 1; //y = mx + b
float b = 0;
float f = 0;
float xmean = 0;
float ymean = 0;
float yhatmean = 0;
float rSquareValue = 0;

void setup() {
  size(800, 800);
  background(255);
}
void drawCurve() {
  float xx1 = 0;
  float xx2 = 0.5;
  float xx3 = 1;
  float yy1 = m*xx1*xx1 + b*xx1 + f;
  float yy2 = m*xx2*xx2 + b*xx2 +f;
  float yy3 = m*xx3*xx3 + b*xx3 +f;
  
  float x1 = map(xx1, 0, 1, 0, width);
  float y1 = map(yy1, 0, 1, height, 0);
  float x2 = map(xx2, 0, 1, 0, width);
  float y2 = map(yy2, 0, 1, height, 0);
  float x3 = map(xx3, 0, 1, 0, width);
  float y3 = map(yy3, 0, 1, height, 0);
  
  beginShape();
  noFill();
  stroke(255, 0, 255);
  curveVertex(x1, y1);
  curveVertex(x1, y1);
  curveVertex(x2, y2);
  curveVertex(x3, y3);
  curveVertex(x3, y3);
  endShape();
}

void mousePressed() {
  float x = map(mouseX, 0, width, 0, 1);
  float y = map(mouseY, 0, height, 1, 0);
  PVector point = new PVector(x, y);
  data.add(point);
}

void linearRegression(){
  float upperPart = 0;
  float lowerPart = 0;
  for(int i = 0; i < data.size(); i ++){
    upperPart = upperPart + (data.get(i).x - xmean)*(data.get(i).y - ymean);
    lowerPart += (data.get(i).x - xmean)*(data.get(i).x - xmean);
  }
  m = upperPart / lowerPart;
  b = ymean -m * xmean;
}
void gradientDescent(){
  float learningRate = 0.05;
  for(int i = 0; i < data.size(); i ++){
    float x = data.get(i).x;
    float y = data.get(i).y;
    float predict = m * x * x + b * x + f;
    float error = y - predict;
    float nabla = m * x +b;
    if(nabla*nabla > 0.02){
    m = m + error * x * x *  learningRate;
    b = b + error * x *learningRate;
    f = f + error*learningRate;
   }
  }
}
void getMeans(){
  float xsum = 0;
  float ysum = 0;
  float yhatsum = 0;
  for(int i = 0; i < data.size(); i ++){
    xsum = xsum + data.get(i).x;
    ysum = ysum + data.get(i).y;
    yhatsum = yhatsum + m*ysum;
    
  }
  xmean = xsum / data.size();
  ymean = ysum / data.size();
  ymean = yhatsum/data.size();
}

/**
 * [rSquare description]
 * @Author   bit2atom
 * @DateTime 2022-11-01T07:30:55+0800
 * @return   {[void]}                 [决定系数，反应因变量的全部变异能通过回归关系被自变量解释的比例。]
 *                                    [如R平方为0.8，则表示回归关系可以解释因变量80%的变异。]
 * R^2 = \frac {SSR}{SST} = \frac{\sum_{i=1}^{n}(\hat y_i - \vec y)^2}
                                 {\sum_{i=1}^{n}(y_i - \vec y)^2}
 */
void rSquare(){
  float ypredictSubYSum = 0;
  float ymeanSquareSum = 0;
  for(int i = 0; i < data.size(); i ++){
    float ypredict = m * data.get(i).x + b;
    //ypredictSubYSum += (data.get(i).y - ypredict)*(data.get(i).y - ypredict);
    ypredictSubYSum += (ymean - ypredict)*(ymean - ypredict);
    ymeanSquareSum += (data.get(i).y - ymean)*(data.get(i).y - ymean);
  }
  //rSquareValue = 1 - ypredictSubYSum / ymeanSquareSum;
  rSquareValue = ypredictSubYSum / ymeanSquareSum;
  
}

void draw() {
  background(255);
  drawCurve();
  for (int i = 0; i < data.size(); i ++) {
    float ex = map(data.get(i).x, 0, 1, 0, width);
    float ey = map(data.get(i).y, 0, 1, height, 0);
    fill(51);
    noStroke();
    ellipse(ex, ey, 10, 10);
  }
  getMeans();
  //linearRegression();
  gradientDescent();
  rSquare();
  fill(0);
  text("R^2: " + rSquareValue, width-100, 50);
  saveFrame();
}
