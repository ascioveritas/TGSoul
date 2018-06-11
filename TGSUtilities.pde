class TGSSettings {
   boolean centercircle;
   boolean outercircles;
   boolean male;
   boolean female;
   
   TGSColorArrayListFactory ColorFactory;
   ArrayList<TGSPosition> DrawHeightSequence; 
   ArrayList<TGSColor>  ColorSequence;
  
  TGSSettings() {
     ColorFactory = new TGSColorArrayListFactory();
     ColorSequence = ColorFactory.GetStandardTGSColorArrayList();
  }
  
  void setcolor(int index) {
     TGSColor newsetting = ColorSequence.get(index);
     //stroke(newsetting.red, newsetting.green, newsetting.blue);
     stroke(newsetting.rgbhex, newsetting.alpha);
  }
  
   void OnlyTriangles() {
     for(int i = 0; i < 10; i++) {
      if( ! ((i == 1) || ( i == 2 )) ) {
        TGSColor TempTGSColor = ColorSequence.get(i);
        TempTGSColor.alpha = 0;
        ColorSequence.set(i, TempTGSColor);
      }
     }
   }
   
     void AllVisible() {
     for(int i = 0; i < ColorSequence.size(); i++) {
        TGSColor TempTGSColor = ColorSequence.get(i);
        TempTGSColor.alpha = 255;
        ColorSequence.set(i, TempTGSColor);
     }
   }
   
  void OnlyCircles() {
     for(int i = 0; i < 10; i++) {
      if(  ((i == 1) || ( i == 2 )) ) {
        TGSColor TempTGSColor = ColorSequence.get(i);
        TempTGSColor.alpha = 0;
        ColorSequence.set(i, TempTGSColor);
      }
     }
   }
   
   void SetColorIndex(int index, int inrgbhex) {
        TGSColor TempTGSColor = ColorSequence.get(index);
        TempTGSColor.rgbhex = inrgbhex;
        ColorSequence.set(index, TempTGSColor);      
  }
  
  void ShiftChakras() {
    
  }
  
  void UpdateMaleForm(int i) {
       if(i == 0) {
         SetColorIndex(1, ColorFactory.getViolet());
         SetColorIndex(2, ColorFactory.getBlack());
       } else {
         SetColorIndex(1, ColorFactory.getBlack());
         SetColorIndex(2, ColorFactory.getViolet());           
       } 
  }
  
  void FemaleForm() {
    
  }
  
  void HeartCenterMap() {
       SetColorIndex(1, ColorFactory.getBlack());
       SetColorIndex(2, ColorFactory.getBlack());
       SetColorIndex(0, ColorFactory.getViolet());
       //Shift Top Colors
    //Top Right Circle - 4
    SetColorIndex(4, ColorFactory.getBlue());
    SetColorIndex(8, ColorFactory.getGreen());
    SetColorIndex(9, ColorFactory.getIndigo());
  }
  
   
   void SpiritForm() {
       SetColorIndex(1, ColorFactory.getViolet());
       SetColorIndex(2, ColorFactory.getViolet());
       SetColorIndex(0, ColorFactory.getViolet());
       
   }
   
   void SharedForm(int i) {
       if(i == 0) {
         SetColorIndex(1, ColorFactory.getViolet());
         SetColorIndex(2, ColorFactory.getBlack());
       } else {
         SetColorIndex(1, ColorFactory.getBlack());
         SetColorIndex(2, ColorFactory.getViolet());           
       }
   }
   
   void PhysicalForm() {
       SetColorIndex(1, ColorFactory.getBlack());
       SetColorIndex(2, ColorFactory.getBlack());
   }
   
}

class TGSColorArrayListFactory {
  
  int RedEssence, OrangeEssence, YellowEssence, GreenEssence, BlueEssence, IndigoEssence, VioletEssence, PhysicalEssence, SpiritualEssence, MaleEssence, FemaleEssence;
  
  ArrayList<TGSColor> GetStandardTGSColorArrayList() {
    ArrayList<TGSColor> TempTGSAL = new ArrayList<TGSColor>();
    //TempTGSAL.add(new TGSColor(255, 0, 0));
    //Center Circle - 0
    TempTGSAL.add( new TGSColor(getGreen()));
    //Female Triangle
    TempTGSAL.add( new TGSColor(getMaleColor()));
    //Male Triangle
    TempTGSAL.add( new TGSColor(getFemaleColor()));
    //Top Circle - 3
    TempTGSAL.add( new TGSColor(getViolet()));
    //Top Right Circle - 4
    TempTGSAL.add( new TGSColor(getIndigo()));
    //Bottom Right Circle - 5
    TempTGSAL.add( new TGSColor(getYellow()));
    //Bottom Circle - 6
    TempTGSAL.add( new TGSColor(getRed()));
    //Bottom Left Circle - 7
    TempTGSAL.add( new TGSColor(getOrange()));
    //Top Left Circle - 8
    TempTGSAL.add( new TGSColor(getBlue()));
    //Top Circle - 9
    TempTGSAL.add( new TGSColor(getViolet()));
    return TempTGSAL;

  }
    
    int getRed() {
   return #E3171A;
  }
  
    int getYellow() {
   return #FEFF08;
  }
  
    int getOrange() {
   return #FFCD00;
  }
  
    int getGreen() {
   return #1BB90D;
  }
  
    int getBlue() {
   return #2B15FF;
  }
  
    int getIndigo() {
   return #730DBC;
  }
  
    int getViolet() {
   return #C613F0;
  }
  
  int getBlack() {
   return #000000;    
  }
  
  int getFemaleColor() {
   return #171BE3;
  }
  
  int getMaleColor() {
   return #E3171A;
  }
  
  
  
}


class TGSPosition {
  
  
}

class TGSColor {
  float opacity;
  float alpha;
  float red;
  float green;
  float blue;
  int rgbhex;
  
  
  TGSColor(int inrgbhex) {
    rgbhex = inrgbhex;
    alpha = 100;
    //alpha = 15;
  }
  
  TGSColor(int inrgbhex, int inalpha) {
    rgbhex = inrgbhex;
    alpha = inalpha;
    //alpha = 15;
  }
  
  TGSColor(int inred, int ingreen, int inblue) {
    red = inred;
    green = ingreen;
    blue = inblue;
  }
}
