import peasy.*;
import queasycam.*;

PeasyCam Pcam;
QueasyCam cam;

boolean enableQueasyCam = true;

ArrayList<TGSCircle> TGSDisplayCircles;
ArrayList<TGSCircumHexagram> TGSDisplaySet;

boolean InteractiveMode = false;
boolean Enable3dSpheres = false;


int defaultRadius = 500;
int defaultStrokeWeight = 4;
int defaultsw = 1920;
int defaultsh = 1080;


void setup() {
  size(1920, 1080, P3D);
  
  if(!enableQueasyCam) {
    Pcam = new PeasyCam(this, 0,0,0, 2000);  
  } else {
  cam = new QueasyCam(this);
  cam.speed = 5;              // default is 3
  cam.sensitivity = 0.5;      // default is 2
  cam.position = new PVector(0,2000,2000);
  cam.tilt = 6 * -PI/16;
  cam.pan = 8 * -PI/16;
  
  }
  perspective(PI/3, (float)width/height, 0.01, 10000);
  
  background(255);
  noStroke();
  strokeWeight(defaultStrokeWeight); 
  TGSDisplaySet = new ArrayList<TGSCircumHexagram>();
 
  
// Objects can be added to an ArrayList with add()
//  TGSDisplaySet.add(new TGSCircumHexagram(100,100, 200));


  //MetaphysicalMap
  //MetaphysicalSelfMap(0, 300, 0, 200, 0, 0);

  //ChakraMap
  //ChakraMap(0, 300, 0, 200, 0, 0);

  //RelationalUnionMap
  
  PrimarySelfFieldMap(0, 300, 0, 200, 0, 0);
  PrimarySelfFieldMap(0, 300, 0, 200, 0, PI/2);
  PrimarySelfFieldMap(0, 300, 0, 200, PI, 0);
  
  
  

}

void ChakraMap(int x, int y, int z, int radius, float rotation, float zrotation) { 

  int posdiff = (int) ((float) radius *  1.6666666666666);
  
  TGSCircumHexagram SpiritSelf = new TGSCircumHexagram(x, y, radius, rotation, zrotation);
  SpiritSelf.CurrentSettings.OnlyCircles();

  TGSDisplaySet.add(SpiritSelf);
  
}

void MetaphysicalSelfMap(int x, int y, int z, int radius, float rotation, float zrotation) { 

  int posdiff = (int) ((float) radius *  1.6666666666666);
  
  TGSCircumHexagram SpiritSelf = new TGSCircumHexagram(x, y, radius, rotation, zrotation);
  SpiritSelf.CurrentSettings.SpiritForm();
  SpiritSelf.CurrentSettings.OnlyTriangles();
  TGSCircumHexagram SoulEssenceSelf = new TGSCircumHexagram(x, y + posdiff, radius, rotation, zrotation);
  SoulEssenceSelf.CurrentSettings.SharedForm(0);
  SoulEssenceSelf.CurrentSettings.OnlyTriangles();
  TGSCircumHexagram PhysicalSelf = new TGSCircumHexagram(x, y + (2 * posdiff), radius, rotation, zrotation);
  PhysicalSelf.CurrentSettings.PhysicalForm();
  PhysicalSelf.CurrentSettings.OnlyTriangles();
  
  TGSDisplaySet.add(SpiritSelf);
  TGSDisplaySet.add(SoulEssenceSelf);
  TGSDisplaySet.add(PhysicalSelf);

  
}

void PrimarySelfFieldMap(int x, int y, int z, int radius, float rotation, float zrotation) {

  
  //int scale = (int) ((float) radius *  0.818181818181818);
  //int scale = (int) ((float) radius *  1.222222222222222);
  int posdiff = (int) ((float) radius *  1.6666666666666);
  

  TGSCircumHexagram SpiritSelf = new TGSCircumHexagram(x, y, radius, rotation, zrotation);
  SpiritSelf.CurrentSettings.SpiritForm();
  SpiritSelf.CurrentSettings.HeartCenterMap();
  TGSCircumHexagram SoulEssenceSelf = new TGSCircumHexagram(x, y + posdiff, radius, rotation, zrotation);
  SoulEssenceSelf.CurrentSettings.SharedForm(0);
  SoulEssenceSelf.CurrentSettings.HeartCenterMap();
  TGSCircumHexagram PhysicalSelf = new TGSCircumHexagram(x, y + (2 * posdiff), radius, rotation, zrotation);
  PhysicalSelf.CurrentSettings.PhysicalForm();
  PhysicalSelf.CurrentSettings.HeartCenterMap();
  
  TGSDisplaySet.add(SpiritSelf);
  TGSDisplaySet.add(SoulEssenceSelf);
  TGSDisplaySet.add(PhysicalSelf);
  

  
}

void draw() {
 background(255);
 for (TGSCircumHexagram TGSC : TGSDisplaySet) {
  TGSC.display();
 } 
 
 ProcessInteraction();
 
}


void mousePressed() {
  if (InteractiveMode) {
    
  } else {
    return;
  } 
  
 if (mouseButton == LEFT) {
   //left click
   TGSDisplaySet.add(new TGSCircumHexagram(mouseX,mouseY, defaultRadius));      
   
  } else if (mouseButton == RIGHT) {
    // right click
  } else 
  { 
  //no activity
  }
} 

void keyPressed() {
  if(enableQueasyCam) {
  if ( (key == 'y' || key == 'Y') ) {
    cam.controllable = ! cam.controllable;
  } 
  }
}

void ProcessInteraction() {
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
