class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxforce;
  float maxspeed;
  float lifespan;
  PVector desired;
  color c;

  Particle(color c_) {
    c = c_;
    location = new PVector(random(width), random(height));
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  // maxspeed = 5;
   maxforce = 0.2;  
    lifespan = 100;

  c = color(100);
    //c = color(random(255), random(255), random(255));
  }

  void run() {
    update();
    borders();
    display();
  }

  void follow(FlowField flow) {
    desired = flow.lookup(location);
    maxspeed = desired.mag()/2;
    desired.mult(maxspeed);
    //
    PVector steer = PVector.sub(desired, velocity);
    maxforce = steer.mag()*0.01; //funkar bra
    steer.limit(maxforce);
    applyForce(steer);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2/velocity.mag();
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    stroke(c, lifespan);
    strokeWeight(1);
    line(0, 0, velocity.x*5, velocity.y*5);
    popMatrix();
  }

  void borders() {
    /*
    if (location.x < 0) location.x = width;
     if (location.y < 0) location.y = height;
     if (location.x > width) location.x = 0;
     if (location.y > height) location.y = 0;
     */
    if (location.x < 0) lifespan = 0.0;
    if (location.y < 0) lifespan = 0.0;
    if (location.x > width) lifespan = 0.0;
    if (location.y > height) lifespan = 0.0;
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
