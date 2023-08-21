class cloud{
PVector clloc;
PVector clsp;

cloud(){
clloc=new PVector(width+random(10),random(1,height-1));
clsp = new PVector(1,0);

}
void windy(){
clloc.add(clsp);
}

void show(){
clloc.x=width;
rect(clloc.x,clloc.y,scale*2, scale*2);
fill(0,0,50);
}

}
