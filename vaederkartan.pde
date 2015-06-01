//vindkarta

import java.util.Iterator;

//Particle
//ParticleSystem
//FlowField
//DataFetcher

ParticleSystem ps;

void setup() {
  size(displayWidth/2, displayHeight/2, P2D);
  ps = new ParticleSystem();
  blendMode(ADD);
  smooth();
}

void draw() {

  background(0);
  ps.run();
}
