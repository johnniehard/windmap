//vindkarta

import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;

import java.util.Iterator;

//Particle
//ParticleSystem
//FlowField
//DataFetcher

ParticleSystem ps; //sköter flowfield, partiklar och egentligen allt som inte är att rita kartan

UnfoldingMap map;

void setup() {
  size(displayWidth, displayHeight, P2D);

 // blendMode(ADD);
 // smooth();
 noSmooth();
 
 map = new UnfoldingMap(this, new Microsoft.AerialProvider());
 //MapUtils.createDefaultEventDispatcher(this, map);
 map.zoomAndPanTo(new Location(63, 15), 5);
   ps = new ParticleSystem(map);
}

void draw() {

  background(0);
  map.draw();
  ps.run();
}
