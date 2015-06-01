//vindkarta

import java.util.Iterator;

//Particle
//ParticleSystem
//FlowField
//DataFetcher

ParticleSystem ps;

void setup() {
  size(displayWidth, displayHeight, P2D);
  ps = new ParticleSystem();
  blendMode(ADD);
}

void draw() {

  //background(0);
  ps.run();
}
