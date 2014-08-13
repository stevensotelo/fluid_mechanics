class Fluido extends Figura{  
  // Coefficient of drag
  float c;
  // Densidad
  float densidad;

  Fluido(float w_, float h_,float x, float y, color colorF_, float densidad_, float c_) {
    super(w_,h_,x,y,colorF_);
    densidad = densidad_;
    c = c_;
  }
  
  // Is the Solido in the Liquid?
  boolean contains(Solido m) {
    PVector l = m.location;
    if (l.y > super.location.y && l.y < super.location.y + super.h)
      return true;
    else 
      return false;
  }
  
  // Is the Solido in the Liquid?
  boolean empujar(Solido m) {
    PVector l = m.location;
    if (l.y > (super.location.y + (super.h/5))) 
      return true;
    else 
      return false;
  }
  
  // Calculate drag force
  PVector drag(Solido m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);
    
    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }  

  // Calculate drag force
  PVector dragFloat(Solido m) {
    PVector force = m.velocity.get();
    force.mult(-1);
    return force;    
  }  
  void display() {
    super.display(0,0,false);
  }

}

