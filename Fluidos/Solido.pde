class Solido extends Figura {

  // velocity and acceleration 
  PVector velocity;
  PVector acceleration;
  // Densidad
  float densidad;
  // Masa
  float mass;

  Solido(float w_,float h_,  float x, float y, color colorF_, float densidad_, float m) {
    super(w_,h_,x,y,colorF_);
    densidad = densidad_;
    mass = m;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }
    
  void inverseMove(){
    velocity.y *= -1;
  }

  void update() {    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Location changes by velocity
    super.location.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }
  
  float sumergido(float densidadFluido)
  {
    return (densidad*h)/densidadFluido;
  }
  
  // Draw Solido
  void display() {
    super.display(0,2*2.25,true);
  }  
}


