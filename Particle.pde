class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxforce;
  float maxspeed;
  float lifespan;
  color c;

  Particle(color c_) {
    c = c_;
    location = new PVector(random(width), random(height));
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    maxspeed = random(2, 5);
    maxforce = random(0.1, 0.5);
    lifespan = 150;
    c = color(255);
    //c = color(random(255), random(255), random(255));
  }

  void run() {
    update();
    borders();
    display();
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
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
   lifespan -= 2.0;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    stroke(c, lifespan);
    strokeWeight(1);
    line(0, 0, velocity.x*3, velocity.y*3);
    popMatrix();
  }

  void borders() {
    if (location.x < 0) location.x = width;
    if (location.y < 0) location.y = height;
    if (location.x > width) location.x = 0;
    if (location.y > height) location.y = 0;
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
