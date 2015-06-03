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

PImage mask;

boolean record = true;

//Particle
//ParticleSystem
//FlowField
//DataFetcher

ParticleSystem ps; //sköter flowfield, partiklar och egentligen allt som inte är att rita kartan

UnfoldingMap map;

void setup() {
  size(displayWidth/2, displayHeight/2, P2D);

  mask = loadImage("mask.png");

  frameRate(30);

  blendMode(ADD);
  // smooth();
  //noSmooth();

  //map = new UnfoldingMap(this, new Microsoft.AerialProvider());
  // map = new UnfoldingMap(this, new EsriProvider.WorldGrayCanvas());
  //map = new UnfoldingMap(this, new EsriProvider.DeLorme());
  map = new UnfoldingMap(this, new AcetateProvider.Basemap());

  //MapUtils.createDefaultEventDispatcher(this, map);
  map.zoomAndPanTo(new Location(63, 15), 4);
  ps = new ParticleSystem(map);
  background(0);
}

void draw() {

  background(50);
  image(mask, 0, 0, width, height);
  //map.draw();
  ps.run();

  if (record) {
    saveFrame("recorded/1/record######.png");
    println(frameCount);
    if (frameCount>=1000) {
      exit();
    }
  }
}
