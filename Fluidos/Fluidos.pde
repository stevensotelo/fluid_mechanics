// Tamano de pantalla
int sizeW,sizeH;
// Boton
float cmdEmpezarW,cmdEmpezarH,cmdEmpezarX,cmdEmpezarY;
color cmdEmpezarColor,cmdEmpezarColorLabel;
String cmdEmpezarLabel; 
// Recipiente
float recipienteW,recipienteH,recipienteX,recipienteY;
color recipienteColor;
// Fluido
float fluidoW,fluidoH,fluidoX,fluidoY;
color fluidoColor;
// Volumen
float volumenW,volumenH,volumenX,volumenY;
color volumenColor;
// Calculos
// rs=Densidad del cuerpo solido, h=Altura del cuerpo solido, rf=Densidad del fluido, x=Parte sumergida del solido
float rs,h,rf,x;

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
  cmdEmpezarW=150;
  cmdEmpezarH=20;
  // Inicializar posiciones
  recipienteX=200;
  recipienteY=100;
  fluidoX=200;
  fluidoY=300;
  volumenX=350;
  volumenY=150;
  cmdEmpezarX=10;
  cmdEmpezarY=10;
  // Inicializar colores
  recipienteColor=color(255,255,255);
  fluidoColor=color(69,119,236);
  volumenColor=color(87,68,75);
  cmdEmpezarColor=color(255,255,255);
  cmdEmpezarColorLabel=color(0,0,0);
  size(sizeW, sizeH);
  // Inicializar variables
}

void draw(){
  // Constantes
  fill(recipienteColor);
  rect(recipienteX, recipienteY, recipienteW, recipienteH);
  fill(fluidoColor);  
  rect(fluidoX, fluidoY, fluidoW, fluidoH);
  // Botones  
  fill(cmdEmpezarColor);  
  rect(cmdEmpezarX, cmdEmpezarY, cmdEmpezarW, cmdEmpezarH);
  // Texto
  textSize(16);
  fill(cmdEmpezarColorLabel);
  text("Empezar", 12, 25); 
  // Animacion
  fill(volumenColor);  
  rect(volumenX, volumenY, volumenW, volumenH);
}
