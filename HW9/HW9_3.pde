Snake s;
//cloud yun1;
//cloud yun2;
//cloud yun3 ;


int shake;
int fchoose;
float scale=30; float xscale;float yscale;//总网格数目、width上的网格个数、height上的网格个数
//float yunl;
PVector food; PVector position;//食物所在的位置格点（个）、食物所在的位置（width）
PVector clloc;
PVector clsp;
//boolean start = true; 

boolean ate; 
PImage grass; PImage flower1; PImage flower2; PImage flower3; PImage cloud;

void setup(){
size(600,600);
s = new Snake();

//yun1 = new cloud();
//yun2 = new cloud();
//yun3 = new cloud();

//yunl = 0;

frameRate(4);
xscale=width/scale;
yscale=height/scale;
fchoose = 0;

grass = loadImage("grass.jpg");
flower1 = loadImage("flower1.png");
flower2 = loadImage("flower2.png");
flower3 = loadImage("flower3.png");
cloud = loadImage("cloud.png");

food = new PVector(floor(random(1, xscale-1)),floor(random(1, yscale-1)));
//shake =  floor(random(0,7));
picnic();

clloc=new PVector(width+random(10),random(1,height-1));
clsp = new PVector(-1,0);

}

void draw(){
image(grass,0,0,width,height);
//s.start();


beginShape();
fill(20,0,90);
if (food.x %7 ==0 || food.x %7 ==4 || food.x %7 ==6){image(flower1,food.x,food.y,scale,scale); fchoose=1;}
//rect(food.x,food.y,scale,scale);}
else if(food.x %7 ==1 || food.x %7 ==3 ){image(flower2,food.x,food.y,scale,scale);fchoose=2;}
else {image(flower3,food.x,food.y,scale,scale); fchoose=3;}
endShape();
//if(food.y%5 == 0){yunl=1;}
//else if(food.y%5 == 1){ yunl=2;}
//else if(food.y%5 == 2){  yunl=3;}
//else if(food.y%5 == 3){  yunl=4;}
//else{yunl =0 ;}

//if(yunl >0){
//for(int i=0;i<yunl;i++){yun[i].show();yun[i].windy();}}
beginShape();
image(cloud,clloc.x,clloc.y,scale*4, scale*2);
clloc.add(clsp);
endShape();

s.update();
s.display();
s.border();
s.move();
//s.keyPressed();
//s.keyReleased();
s.eat();
if(ate){picnic(); }
s.lifeCount();
s.overGame();

//yun1.windy(); yun2.windy(); yun3.windy();
//yun1.show();yun2.show();yun3.show();




}


void picnic(){
food = new PVector(floor(random(1, xscale-1)),floor(random(1, yscale-1)));
position = food.mult(scale);
}
//void start(){
//if(key=='l'||key=='L'){start = tr
