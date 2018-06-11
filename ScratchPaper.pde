
class InscribedPolygon {
  float x, y, z;
  float radius;

  InscribedPolygon(int inx, int iny, int inradius) {
   x = inx;
   y = iny;
   z = 0;
   radius = inradius;
  }

  // Custom method for drawing the object
  void display() {
    noFill();
    stroke(100);
    pushMatrix();
    translate(x,y, z);
    ellipse(0,0, radius, radius);
    popMatrix();
    
    pushMatrix();
    translate(x,y, z);
    
    rotate(PI/2);
    for(float tpi = 0; tpi < 2*PI; tpi= tpi + PI/2) {
      pushMatrix();
      rotate(tpi);
      polygon(0, 0, radius/2, 3);
      popMatrix();
    }
    popMatrix();
  }
}  

class TGSCircle {
  float x, y, z;
  float radius;

  TGSCircle(int inx, int iny, int inradius) {
   x = inx;
   y = iny;
   z = 0;
   radius = inradius;
  }

  // Custom method for drawing the object
  void display() {
    noFill();
    stroke(100);
    pushMatrix();
    translate(x,y, z);
    ellipse(0,0, radius, radius);
    popMatrix();
    
    pushMatrix();
    translate(x,y, z);
    
    rotate(PI + PI/2);
    if(true) {
    for(float tpi = 0; tpi < 2*PI; tpi = tpi + (PI)/3) {
      pushMatrix();
      rotate(tpi);
      polygon(0, 0, radius/2, 3);
      popMatrix();
    }
    } else {
       polygon(0, 0, radius/2, 3);
    }
    popMatrix();
  }
}
