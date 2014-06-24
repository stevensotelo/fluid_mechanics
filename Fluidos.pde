// Tamano de pantalla
int sizeW,sizeH;
// Recipiente
float recipienteW,recipienteH,recipienteX,recipienteY;
color recipienteColor;
// Fluido
float fluidoW,fluidoH,fluidoX,fluidoY;
color fluidoColor;
// Volumen
float volumenW,volumenH,volumenX,volumenY;
color volumenColor;

void  setup(){
  // Inicializar tamanos
  sizeW=800;
  sizeH=600;
  recipienteW=400;
  recipienteH=400;  
  fluidoW=400;
  fluidoH=200;
  volumenW=100;
  volumenH=250;
  // Inicializar posiciones
  recipienteX=200;
  recipienteY=100;
  fluidoX=200;
  fluidoY=300;
  volumenX=350;
  volumenY=150;
  // Inicializar colores
  recipienteColor=color(255,255,255);
  fluidoColor=color(69,119,236);
  volumenColor=color(87,68,75);
  size(sizeW, sizeH);
}

void draw(){
  fill(recipienteColor);
  rect(recipienteX, recipienteY, recipienteW, recipienteH);
  //noFill();
  fill(fluidoColor);  
  rect(fluidoX, fluidoY, fluidoW, fluidoH);
  fill(volumenColor);  
  rect(volumenX, volumenY, volumenW, volumenH);
}
