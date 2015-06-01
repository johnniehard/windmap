class ParticleSystem {
  ArrayList<Particle> particles;  
  FlowField flowfield;
  color c;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
    flowfield = new FlowField(30);
  }

  void addParticle(color c) {
    particles.add(new Particle(c));
  }

  void run() {
    if(frameCount%100 == 0){
     flowfield.init(); 
     c = color(random(255), random(255), random(255));
     background(0);
    }
    
    for(int i = 0; i < 200; i++){
    addParticle(c);
    }
    
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext ()) {
      Particle p = it.next();
      p.follow(flowfield);
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
