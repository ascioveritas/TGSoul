int defaultDepth = 10;


class TGSCircumHexagram {
  float x, y, z;
  float radius;
  TGSSettings CurrentSettings;
  float xyrotation;
  float zrotation;

  TGSCircumHexagram(int inx, int iny, int inradius, float inxyrotation, float inzrotation) {
    zrotation = inzrotation;
    xyrotation = inxyrotation;
    VariableSetup(inx, iny, inradius);
  }

  TGSCircumHexagram(int inx, int iny, int inradius, float inxyrotation) {
    xyrotation = inxyrotation;
    VariableSetup(inx, iny, inradius);
  }
  
  TGSCircumHexagram(int inx, int iny, int inradius) {
    xyrotation = 0;
    VariableSetup(inx, iny, inradius); 
  }
  
  void VariableSetup(int inx, int iny, int inradius) { 
   x = inx;
   y = iny;
   z = 0;
   radius = inradius;
   
   CurrentSettings = new TGSSettings();
   //CurrentSettings.OnlyTriangles();
   //CurrentSettings.OnlyCircles();
   //CurrentSettings.SpiritForm();
   //CurrentSettings.PhysicalForm();
   //CurrentSettings.HeartCenterMap();
   
  }
  
  void UpdateVisibilityDepth(int depth, int numcalls) {
    if(numcalls == 1) {
      CurrentSettings.AllVisible();
    } else {
      CurrentSettings.OnlyTriangles();
    }
  }

  
void UpdateColorDepth(int depth, int numcalls) {
    //CurrentSettings.SharedForm(depth % 2);
  }
  
  
  void UpdateDepthSettings(int depth, int numcalls) {
    //UpdateVisibilityDepth(depth, numcalls);
    //UpdateColorDepth(depth, numcalls);
  }
  
  
  void DrawCenterCircle() {
    pushMatrix();
    CurrentSettings.setcolor(0);
    translate(x,y, z);
    ellipse(0,0, radius, radius);
    popMatrix();
  }
  
  void DrawInscribedTriangles() {

    int colorIndex = 1;
    pushMatrix();
    translate(x,y, z);
    rotate(PI + PI/2);
    float tpi = 0;
    //for(float tpi = 0; tpi < 2*PI; tpi = tpi + (PI)/3) {
    for(float i = 0; i < 2; i++) {
      pushMatrix();
      rotate(tpi);
      CurrentSettings.setcolor(colorIndex);
      polygon(0, 0, radius/2, 3);
      popMatrix();
      
      tpi = tpi + (PI)/3;
      colorIndex++;
    }
    
    stroke(255,255,255);
    popMatrix();
  }
  
  void SphereColorSettings(int colorIndex) {

     if(Enable3dSpheres) {
        CurrentSettings.set3dcolor(colorIndex); 
      } else {
        CurrentSettings.setcolor(colorIndex);  
      }
  }
  
  void DrawSpheroid() {
    if(Enable3dSpheres) {
        sphere(radius);
      } else {
        ellipse(0,0, radius, radius);  
      }
  }
  
  void DrawOuterCircles() {
     int colorIndex = 3;
     pushMatrix();
     translate(x,y, z);
     rotate(PI);
    for(float tpi = 0; tpi < 2*PI; tpi = tpi + (PI)/3) { // - (PI)/3
      pushMatrix();
      rotate(tpi);
      translate(0, radius/2);
      pushStyle();
      SphereColorSettings(colorIndex);   
      DrawSpheroid();
      popStyle();
      popMatrix();
      colorIndex++;
    }
    popMatrix();
    
  }
  
  void displaysteps() {

    noFill();
    stroke(100);
    DrawCenterCircle();
    DrawInscribedTriangles();
    DrawOuterCircles();    
  }
 

  void recursivedisplay(float inradius, int depth, int numcalls) {
    radius = inradius;
    if(depth > 0) {
       UpdateDepthSettings(depth, numcalls);
       displaysteps();
       recursivedisplay(inradius/2, depth-1, numcalls+1);
    }
  }

  // Custom method for drawing the object
  void display() {
    pushMatrix();
    rotateZ(xyrotation);
    rotateX(zrotation);
    //rotateY(zrotation);
    float tempRadius = radius;
    recursivedisplay(tempRadius , defaultDepth, 1);
    radius = tempRadius;
    
    popMatrix();
  }
}
