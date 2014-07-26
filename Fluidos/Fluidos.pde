import controlP5.*;
// Tamano de pantalla
int sizeW,sizeH;
// Controles
ControlP5 cp5;
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
float densidadSolido=100,alturaSolido=150,rf,x;
// Datos de control
boolean primeraVezEmpezar,primeraVezReiniciar;
float posicionYInicial;

void  setup(){
  // Datos de Control
  primeraVezEmpezar=true;
  primeraVezReiniciar=true;
  posicionYInicial=150;
  // Inicializar tamanos  
  sizeW=800;
  sizeH=600;
  recipienteW=400;
  recipienteH=400;  
  fluidoW=400;
  fluidoH=200;
  volumenW=densidadSolido;
  volumenH=alturaSolido;
  // Inicializar posiciones
  recipienteX=200;
  recipienteY=100;
  fluidoX=200;
  fluidoY=300;
  volumenX=350;
  volumenY=posicionYInicial;
  // Inicializar colores
  recipienteColor=color(255,255,255);
  fluidoColor=color(69,119,236);
  volumenColor=color(87,68,75);
  size(sizeW, sizeH);
  // Controles
  cp5 = new ControlP5(this);
  cp5.addButton("empezar").setValue(0).setPosition(20,20).setSize(80,22);
  cp5.addButton("reiniciar").setValue(0).setPosition(20,50).setSize(80,22);
  cp5.addSlider("densidadSolido").setPosition(20,80).setRange(0,255);
  cp5.addSlider("alturaSolido").setPosition(20,110).setRange(0,300);
}

void draw(){
  // Desplazamiento del solido horizontal
  volumenX+=(volumenW-densidadSolido)/2;
  volumenW=densidadSolido;
  volumenH=alturaSolido;
  // Constantes
  fill(recipienteColor);
  rect(recipienteX, recipienteY, recipienteW, recipienteH);
  fill(fluidoColor);  
  rect(fluidoX, fluidoY, fluidoW, fluidoH);
  // Animacion
  fill(volumenColor);  
  rect(volumenX, volumenY, volumenW, volumenH);
}

public void empezar(int theValue){
  if(!primeraVezEmpezar)
    volumenY+=50;
  else
    primeraVezEmpezar=false;
}

public void reiniciar(int theValue){
  if(!primeraVezReiniciar)    
    volumenY=posicionYInicial;
  else
    primeraVezReiniciar=false;
}
