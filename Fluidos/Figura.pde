// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Figura {
  // location 
  PVector location;
  // Size
  float w, h;
  // Color
  color colorF;

  Figura(float w_,float h_, float x, float y, color colorF_) {
    location = new PVector(x, y);
    colorF = colorF_;
    w = w_;
    h = h_;
  }
 
  // Draw 
  void display(float stroke_,float strokeWeight_, boolean showStroke) {
    if(showStroke)
    {
      stroke(stroke_);
      strokeWeight(strokeWeight_);
    }
    else
      noStroke();
    fill(colorF);
    rect(location.x, location.y, w, h);
  }

}


