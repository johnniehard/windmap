class ParticleSystem {
  ArrayList<Particle> particles;  
  FlowField flowfield;
  color c;

  ParticleSystem(UnfoldingMap map_) {
    particles = new ArrayList<Particle>();
    flowfield = new FlowField(100, map_);
    c = color(255, 100, 100);
    
   // for(int i = 0; i < 40000; i++){
     //addParticle(c); 
   // }
  }

  void addParticle(color c) {
    particles.add(new Particle(c));
  }

  void run() {
   // if(frameCount%200 == 0){
   //  flowfield.init(); 
     //c = color(random(255), random(255), random(255));
  //  }
    
    for(int i = 0; i < 1000; i++){
    addParticle(c);
    }
    
    //flowfield.display();
    
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
