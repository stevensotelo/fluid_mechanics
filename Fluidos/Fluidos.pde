import controlP5.*;
// Tamano de pantalla
int sizeW,sizeH;
// Controles
ControlP5 cp5;
DropdownList fluido;
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
float densidadSolido=100,alturaSolido=150,densidadFluido=1,x=0;
// Datos de control
boolean primeraVezEmpezar,primeraVezReiniciar;
float posicionYInicial;
// Labels
Textlabel labelX,labelFluido;

void  setup(){
  // Datos de Control
  primeraVezEmpezar=true;
  primeraVezReiniciar=true;  
  // Inicializar tamanos  
  sizeW=630;
  sizeH=470;
  recipienteW=400;
  recipienteH=400;  
  fluidoW=400;
  fluidoH=200;
  volumenW=densidadSolido;
  volumenH=alturaSolido;
  // Inicializar posiciones
  recipienteX=200;
  recipienteY=20;
  fluidoX=200;
  fluidoY=220;
  volumenX=350;
  posicionYInicial=30;
  volumenY=posicionYInicial;
  // Inicializar colores
  recipienteColor=color(255,255,255);
  fluidoColor=color(69,119,236);
  volumenColor=color(87,68,75);
  size(sizeW, sizeH);
  // Controles
  cp5 = new ControlP5(this);
  cp5.addButton("empezar").setValue(0).setPosition(20,20).setSize(60,22);
  cp5.addButton("reiniciar").setValue(0).setPosition(100,20).setSize(60,22);
  cp5.addSlider("densidadSolido").setPosition(20,80).setRange(50,255);
  cp5.addSlider("alturaSolido").setPosition(20,100).setRange(0,180);
  fluido = cp5.addDropdownList("fluido").setPosition(20, 140);
  customize(fluido);
  labelX = cp5.addTextlabel("labelX").setText("X =").setPosition(20,150);
  labelFluido = cp5.addTextlabel("labelFluido").setText("FLUIDO =").setPosition(20,170);
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
  labelX.setText("X = " + x);
  labelFluido.setText("FLUIDO = " + densidadFluido);
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

void customize(DropdownList ddl) {
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().set("Fluido");
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  ddl.addItem("Agua", 1);
  ddl.addItem("Aceite", 2);
  ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    x=theEvent.getController().getValue();
  }
}

void calcularSolidoSumergido(){
  x=(densidadSolido*alturaSolido)/densidadFluido;
  volumenY=(fluidoY-volumenY+alturaSolido)+volumenY+x;
  println("x " + x + " volumenY " + volumenY);
}

