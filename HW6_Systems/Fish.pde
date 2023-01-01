class Fish {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PImage fish;
  float topspeed;
 
  Fish() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
    fish = loadImage("fish.png");
  }
  void update() {
   PVector mouse = new PVector(mouseX,mouseY);
   acceleration = new PVector(0.00005*random(mouseX),0.00005*random(mouseY));
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
  
  }
   void display() {
    stroke(0);
    fill(175);
    image(fish, location.x,location.y,16,16);
    
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
