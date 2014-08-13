import controlP5.*;
// Controles
ControlP5 cp5;
RadioButton rFluido;
// Fluido
Fluido liquido;
// Volumen
Solido solido;
// Recipiente
Figura recipiente;
// Calculos
float densidadSolido,x;
// Datos de control
boolean mover,flotar;
// Labels
Textlabel labelX,labelFluido,labelAltura,labelCreditos;
// Logo
PImage logoUao;

void  setup(){
  size(624, 440);  
  //Fuente de Controles
  ControlFont font = new ControlFont(createFont("Arial",13));
  // Controles
  cp5 = new ControlP5(this);
  cp5.setFont(font);
  cp5.addButton("empezar").setValue(0).setPosition(10,20).setSize(80,20);
  cp5.addButton("reiniciar").setValue(1).setPosition(95,20).setSize(94,20);  
  rFluido = cp5.addRadioButton("changedFluido")
         .setPosition(10,45)
         .setSize(20,20)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(2)
         .setSpacingColumn(80)
         .addItem("Agua",1)
         .addItem("Aceite",2)
         .addItem("Alcohol",3)
         .addItem("Otro",4);  
  cp5.addSlider("densidadSolido").setPosition(10,120).setSize(180,20).setRange(100,600).setNumberOfTickMarks(10).setSliderMode(Slider.FLEXIBLE).captionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setText("DENSIDAD SÓLIDO [KG/M3]");
  labelAltura = cp5.addTextlabel("labelAltura").setPosition(10,150);  
  cp5.addButton("resultado").setValue(0).setPosition(10,170).setSize(180,20);
  labelX = cp5.addTextlabel("labelX").setPosition(10,195);
  labelFluido = cp5.addTextlabel("labelFluido").setPosition(10,215);
  labelCreditos = cp5.addTextlabel("labelCreditos").setPosition(0.1,420);
  labelCreditos.setText("DEVELOPED BY: STEVEN SOTELO | STEVENBETANCURT@HOTMAIL.COM | FACULTAD INGENIERÍA");
  logoUao = loadImage("logouao.jpg");  
  reset();
}

void draw(){  
  background(90);
  //Texto de valores  
  labelAltura.draw(this);
  labelX.draw(this);  
  labelFluido.draw(this);
  labelCreditos.draw(this);
  //Logo 
  logoUao.resize(80, 80); 
  image(logoUao, 60, 310);
  // Figuras
  recipiente.display(0,0,false);
  liquido.display();
  if(mover)
  {
    // Sumergido en el fluido
    if(liquido.contains(solido))
    {
      if(liquido.empujar(solido))
      {
        solido.inverseMove();
        flotar=true;        
      }
      else
        solido.applyForce(liquido.drag(solido));
    }
    //Gravedad
    else if(!flotar)
      solido.applyForce( new PVector(0, 0.1*solido.mass));      
    //Se mueve el solido
    solido.update();
    
    if(flotar)
    {      
      if(solido.location.y <= (liquido.location.y-solido.location.y+x))
        mover=false;
    }
  }
  solido.display();  
  if(!mover && flotar)
    labelX.setText("X = " + x + " [M]");
}

void reset(){
  x=0;
  mover=false;
  flotar=false;
  //densidadSolido=100;  
  recipiente = new Figura(400,400,200,20,color(255,255,255));
  liquido = new Fluido(400,200,200,220,color(69,119,236),1000,0.01);
  solido = new Solido(150,150,325,30,color(87,68,75),densidadSolido,1);
  labelAltura.setText("ALTURA SOLIDO = " + solido.h + " [M]");  
  labelX.setText("");
  labelFluido.setText("");
  rFluido.activate(0);
}

public void empezar(int theValue){
  mover=true;
  solido.densidad=densidadSolido;
  x=solido.sumergido(liquido.densidad);
}

public void reiniciar(int theValue){
  reset();
}

public void resultado(int theValue){
  labelFluido.setText("DEN. FLUIDO = " + liquido.densidad + "[KG/M3]");
}

void changedFluido(int a){
  if(mover)
    reset();
  if(a==1)
  {
    liquido.colorF=color(69,119,236);
    liquido.densidad=1000;
  }
  else if(a==2)
  {
    liquido.colorF=color(245,245,76);
    liquido.densidad=920;
  }
  else if(a==3)
  {
    liquido.colorF=color(120,239,255);
    liquido.densidad=790;
  }
  else if(a==4)
  {
    liquido.colorF=color(76,245,118);
    liquido.densidad=random(700,1500);
  }
}


