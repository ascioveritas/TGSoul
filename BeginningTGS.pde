import peasy.*;

PeasyCam cam;

ArrayList<TGSCircle> TGSDisplayCircles;
ArrayList<TGSCircumHexagram> TGSDisplaySet;

boolean InteractiveMode = false;
boolean Enable3dSpheres = true;


int defaultRadius = 500;
int defaultStrokeWeight = 4;
int defaultsw = 1920;
int defaultsh = 1080;


void setup() {
  size(1920, 1080, P3D);
  
  cam = new PeasyCam(this, 960,540,0, 2000);
  
  background(255);
  noStroke();
  strokeWeight(defaultStrokeWeight); 
  TGSDisplaySet = new ArrayList<TGSCircumHexagram>();
 
  
// Objects can be added to an ArrayList with add()
//  TGSDisplaySet.add(new TGSCircumHexagram(100,100, 200));


PrimarySelfFieldMap();

}

void PrimarySelfFieldMap() {

  TGSCircumHexagram SpiritSelf = new TGSCircumHexagram(defaultsw/2, 220, 180);
  SpiritSelf.CurrentSettings.SpiritForm();
  TGSCircumHexagram SoulEssenceSelf = new TGSCircumHexagram(defaultsw/2, 520, 180);
  SoulEssenceSelf.CurrentSettings.SharedForm(0);
  TGSCircumHexagram PhysicalSelf = new TGSCircumHexagram(defaultsw/2, 820, 180);
  PhysicalSelf.CurrentSettings.PhysicalForm();
  
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
