class Bees {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PImage bee;
  float topspeed;
  float mass;
 
  Bees(float m) {
    mass = m;
    location = new PVector(random(width),random(height));//set the appearance of bees
    velocity = new PVector(0,0);
    topspeed = 4; //bees may not fly too fast
    bee = loadImage("bee.png");//pick the image of bees
  }
 
  void update() {
    PVector mouse = new PVector(mouseX,mouseY);//mouse as the honey to catch the bees
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
 
  void display() {
    stroke(0);
    fill(175);
    image(bee, location.x,location.y,16,16);//display the bees
  }
  
 void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);//there might be some force in nature
    acceleration.add(f);
  }
void checkEdges() {
 
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
}
