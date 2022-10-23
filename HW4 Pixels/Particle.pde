class Particle{
float xPos;
float yPos;
float xSpeed;
float ySpeed;
float pSize;


Particle(){
//xPos = random(width);
//yPos = random(height);
//pSize = 10;
xSpeed=noise(width/2 - img.width/2);
ySpeed=noise(height/2 - img.height/2);
}

void Particlepaint(float x,float y,int pColor,float t0, float t1){
fill(pColor);
s = map((x+y)/2,0,10000,0,width/2);

//ellipse(x,y,s,s);
//rect(x,y,s,s);
//arc(x,y,10*s,10*s,t0, t1);

xPos+=xSpeed;
yPos+=ySpeed;//让位置变化，但是可能动出界面外

}


//void pump(){
//if(xPos<0){
//xPos = 0;
//xSpeed*=-1.0;}

//if(xPos>width){
//xPos = width;
//xSpeed*=-1.0;}

//if(yPos<0){
//yPos = 0;
//ySpeed*=-1.0;}

//if(yPos>height){
//yPos = height;
//ySpeed*=-1.0;}


//}
}
