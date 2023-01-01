import com.hamoid.*;

Bees[] Bees = new Bees[300];

void setup() {
  size(640,360);
  background(255);
  for (int i = 0; i < Bees.length; i++) {
//find bees!
    Bees[i] = new Bees(random(0.1,5));
  }
}

void draw() {
  background(255);
  PVector wind = new PVector(0.01,0);
  for (int i = 0; i < Bees.length; i++) {
    Bees[i].update();//update bees
    Bees[i].checkEdges();
    Bees[i].display();
    Bees[i].applyForce(wind);
  }
  
}
 
