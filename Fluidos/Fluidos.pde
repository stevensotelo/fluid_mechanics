import controlP5.*;
// Tamano de pantalla
int sizeW,sizeH;
// Controles
ControlP5 cp5;
RadioButton fluido;
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
float densidadSolido=150,alturaSolido=150,densidadFluido=1000,x=0;
// Datos de control
boolean primeraVezEmpezar,primeraVezReiniciar,mostrarResultado;
float posicionYInicial;
// Labels
Textlabel labelX,labelFluido,labelAltura;
//Mensajes
String msgX,msgFluido;

void  setup(){
  // Datos de Control
  primeraVezEmpezar=true;
  primeraVezReiniciar=true;  
  mostrarResultado=false;
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
  volumenX=325;
  posicionYInicial=30;
  volumenY=posicionYInicial;
  // Inicializar colores
  recipienteColor=color(255,255,255);
  fluidoColor=color(69,119,236);
  volumenColor=color(87,68,75);
  size(sizeW, sizeH);
  // Controles
  cp5 = new ControlP5(this);
  cp5.addButton("empezar").setValue(0).setPosition(20,20).setSize(45,22);
  cp5.addButton("reiniciar").setValue(0).setPosition(70,20).setSize(45,22);
  cp5.addButton("resultado").setValue(0).setPosition(120,20).setSize(50,22);
  fluido = cp5.addRadioButton("fluidoFunction")
         .setPosition(20,50)
         .setSize(40,20)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(2)
         .setSpacingColumn(35)
         .addItem("Agua",1)
         .addItem("Aceite",2)
         .addItem("Alcohol",3)
         .addItem("Otro",4);
  fluido.activate(0);
  cp5.addSlider("densidadSolido").setPosition(20,100).setRange(100,600);
  labelAltura = cp5.addTextlabel("labelAltura").setPosition(20,120);  
  labelX = cp5.addTextlabel("labelX").setPosition(20,130);
  labelFluido = cp5.addTextlabel("labelFluido").setPosition(20,140);
  msgX="";
  msgFluido="";
  
}

void draw(){  
  // Constantes
  fill(recipienteColor);
  rect(recipienteX, recipienteY, recipienteW, recipienteH);
  fill(fluidoColor);  
  rect(fluidoX, fluidoY, fluidoW, fluidoH);
  // Animacion
  fill(volumenColor);  
  rect(volumenX, volumenY, volumenW, volumenH);
  //Texto de valores
  labelAltura.setText("H = " + alturaSolido);
  labelX.setText(msgX);
  if(mostrarResultado)
    labelFluido.setText(msgFluido);
   else
    labelFluido.setText("");
}

public void empezar(int theValue){
  if(!primeraVezEmpezar)
  {
    calcularSolidoSumergido();
    msgX="X = " + x;
    msgFluido= "Densidad Fluido = ?";
  }
  else
  {
    primeraVezEmpezar=false;
    reiniciarTextos();
  }
}

public void reiniciar(int theValue){
  if(!primeraVezReiniciar)
  {  
    volumenY=posicionYInicial;
    reiniciarTextos();
  }
  else
    primeraVezReiniciar=false;
}

public void resultado(int theValue){
  mostrarResultado=!mostrarResultado;
  msgFluido= "Densidad Fluido = " + densidadFluido;
}

void fluidoFunction(int a){
  if(a==1)
  {
    fluidoColor=color(69,119,236);
    densidadFluido=1000;
  }
  else if(a==2)
  {
    fluidoColor=color(245,245,76);
    densidadFluido=920;
  }
  else if(a==3)
  {
    fluidoColor=color(120,239,255);
    densidadFluido=790;
  }
  else
  {
    fluidoColor=color(76,245,118);
    densidadFluido=random(700,1500);
  }   
}

void calcularSolidoSumergido(){
  x=(densidadSolido*alturaSolido)/densidadFluido;
  volumenY=fluidoY-alturaSolido+x;
}

void reiniciarTextos()
{
  msgX="";
  msgFluido="";
}
