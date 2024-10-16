import controlP5.*;//用于交互控制的库
import peasy.*;//便于访问三维场景
import nervoussystem.obj.*;//输出obj的一个库，在processing官网上

int sectionSideNum = 8;
int sideDivision = 40;
int cylinderHeightSection = 200;
float cylinderSectionHeight = 10;
//float colorModel = 150;
int myColorBackgroundR = 150;
int myColorBackgroundG = 150;
int myColorBackgroundB = 150;

float sectionRadiusPhase = TWO_PI;
float twistPhase = PI*2/3;
float twistPhaseStart = TWO_PI;

float[] sectionR = new float[cylinderHeightSection+1];
float[] sectionS = new float[cylinderHeightSection+1];
float[] sectionTwistPhase = new float[cylinderHeightSection+1];

PeasyCam cam;
ControlP5 bar;

boolean displayMesh = false;
boolean record;

void setup() {
  size(2000, 1000, P3D);
  cam = new PeasyCam(this, 2000);//设置相机距离原点的距离
  initiateValues();
  UI();
}

void initiateValues() {
  for (int  i =0; i < cylinderHeightSection+1; i ++) {
    sectionR[i] = 100 + 50 * sin(sectionRadiusPhase/cylinderHeightSection) * i;
    //sectionS[i] = 50 + 50 * sin((sectionRadiusPhase/cylinderHeightSection) * i);
    sectionTwistPhase[i] = twistPhase * cos((twistPhaseStart*2/cylinderHeightSection) * i);
  }
}

void draw() {
  background(myColorBackgroundR, myColorBackgroundG,myColorBackgroundB);
  noStroke();
  rotateX(0.001*frameCount);
  rotateY(0.002*frameCount);
  rotateZ(0.003*frameCount);
  //fill(200+55*sin(random(colorModel)), 200+55*sin(random(colorModel)), 200+55*sin(random(colorModel)));
  if (displayMesh) {
    stroke(0);
  }

  fill(202);
  noStroke();

  lightSettings(); 

  if (record) {
    beginRecord("nervoussystem.obj.OBJExport", "designWork/curvatureVase-####.obj");
  }

  initiateValues();
  drawCylinder();

  if (record) {
    endRecord();
    record = false;
  }

  UIShow();
  //saveFrame("pig-######.png");
}

void drawCylinder() {//构建形体，需要坐标变换的数学方法，定义点，建立相互关系（了解思路和结构）
  float theta = TWO_PI / sectionSideNum;
 // float gama = TWO_PI / sectionSideNum ;

  //beginShape(TRIANGLES);
  //for (int j = 0; j < cylinderHeightSection; j ++) {
  //    for (int i = 0; i < sectionSideNum; i ++) {
  //        vertex(sectionR[j] * cos(theta * i + sectionTwistPhase[j]), sectionR[j] * sin(theta * i + sectionTwistPhase[j]), cylinderSectionHeight * j);
  //        vertex(sectionR[j+1] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]), sectionR[j+1] * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]), cylinderSectionHeight * (j+1));
  //        vertex(sectionR[j] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]), sectionR[j] * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]), cylinderSectionHeight * j);
  //        vertex(sectionR[j] * cos(theta * i + sectionTwistPhase[j]), sectionR[j] * sin(theta * i + sectionTwistPhase[j]), cylinderSectionHeight * j);
  //        vertex(sectionR[j+1] * cos(theta * i + sectionTwistPhase[j+1]), sectionR[j+1] * sin(theta * i + sectionTwistPhase[j+1]), cylinderSectionHeight * (j+1));
  //        vertex(sectionR[j+1] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]), sectionR[j+1] * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]), cylinderSectionHeight * (j+1));
  //    }
  //}
  //endShape();

  beginShape(TRIANGLES);
  for (int j = 0; j < cylinderHeightSection; j ++) {//vector: axis 
    for (int i = 0; i < sectionSideNum; i ++) {//cross section
      float x11 = sectionR[j] * (1- (i%2)*0.5) * cos(theta * i + sectionTwistPhase[j]);
      float y11 = sectionR[j] * (1- (i%2)*0.5) * sin(theta * i + sectionTwistPhase[j]);
      //float p11 = sectionS[j] * cos(theta * i + sectionTwistPhase[j]);
      //float q11 = sectionS[j] * sin(theta * i + sectionTwistPhase[j]);
      
      float x12 = sectionR[j] * (1- (((i+1)%sectionSideNum)%2) * 0.5) * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]);
      float y12 = sectionR[j] * (1- (((i+1)%sectionSideNum)%2) * 0.5) * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]);
      //float p12 = sectionR[j] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]);
      //float q12 = sectionR[j] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]);
      
      float x21 = sectionR[j+1] * (1- (i%2)*0.5) * cos(theta * i + sectionTwistPhase[j+1]);
      float y21 = sectionR[j+1] * (1- (i%2)*0.5) * sin(theta * i + sectionTwistPhase[j+1]);
      float x22 = sectionR[j+1] * (1- (((i+1)%sectionSideNum)%2) * 0.5) * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]);
      float y22 = sectionR[j+1] * (1- (((i+1)%sectionSideNum)%2) * 0.5) * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]);


      float deltaX12 = (x12 - x11) / sideDivision;
      float deltay12 = (y12 - y11) / sideDivision;
      float deltaX22 = (x22 - x21) / sideDivision;
      float deltay22 = (y22 - y21) / sideDivision;

      //beginShape(TRIANGLES);
      for (int k = 0; k < sideDivision; k ++) {//将这些分点连起来
        vertex(x11 + deltaX12 * k, y11 + deltay12 * k, cylinderSectionHeight * j);
        vertex(x21 + deltaX22 * (k+1), y21 + deltay22 * (k+1), cylinderSectionHeight * (j+1));
        vertex(x11 + deltaX12 * (k+1), y11 + deltay12 * (k+1), cylinderSectionHeight * j);

        vertex(x11 + deltaX12 * k, y11 + deltay12 * k, cylinderSectionHeight * j);
        vertex(x21 + deltaX22 * k, y21 + deltay22 * k, cylinderSectionHeight * (j+1));
        vertex(x21 + deltaX22 * (k+1), y21 + deltay22 * (k+1), cylinderSectionHeight * (j+1));
      }
      //endShape();
    }
  }
  endShape();
}

void keyPressed() {//save obj file
  if (key == 's') {
    record = true;
  }
}
