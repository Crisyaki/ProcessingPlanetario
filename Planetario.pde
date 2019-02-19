Planeta[] p;
Estrella star;
boolean[] haySatelite; //true hay satelite, false no
PImage[] texturas;
PImage fondo;
float naveX,naveY,naveZ;
PShape nave;

void setup(){
  size(992 ,614 ,P3D) ;
  noStroke();
  crearEstrella();
  crearPlanetas();
  fondo = loadImage("fondo3.jpg");
  nave = createShape(BOX,15);
  naveZ = 0;
}

void draw(){
  background(fondo);
  
  pushMatrix();
  translate(naveX,naveY,naveZ);
  
  beginShape();
  nave.setTexture(loadImage("banana.jpg"));
  endShape();
  shape(nave);
  
  popMatrix();

  translate ( width /2 , height /2 , 0 ) ;

  pushMatrix();
  star.rotarEstrella();
  popMatrix();
  for(int i = 0; i<p.length;i++){
    pushMatrix();
    p[i].rotarPlaneta(); //Rotación sobre si misma
    if(haySatelite[i]) {
      pushMatrix();
      p[i].getSatelite().rotarSatelite(); //puede ser nulo
      popMatrix();
    }
    popMatrix(); 
  }
}

void crearEstrella(){
  star = new Estrella(100,45,loadImage("estrella.jpg"));
}

void crearPlanetas(){
  p = new Planeta[8];
  haySatelite = new boolean[8];
  p[0] = new Planeta(18,-45,0.5, new Orbita(200, 100 , 0),loadImage("planeta1.jpg"));
  haySatelite[0] = true;
  p[0].createSatelite(5,25,new Orbita(0,0, 40));
  
  p[1] = new Planeta(30,-65,0.10, new Orbita(300 , 80 , 50),loadImage("planeta2.jpg"));
  haySatelite[1] = false;
  
  p[2] = new Planeta(50,80,0.65, new Orbita(200 ,-180 , 50),loadImage("planeta3.jpg"));
  haySatelite[2] = false;
  
  p[3] = new Planeta(25,190,0.73, new Orbita(330 ,90 , 50),loadImage("planeta4.jpg"));
  haySatelite[3] = false;
  
  p[4] = new Planeta(18,15,0.3, new Orbita(200 , 90, 50),loadImage("planeta5.jpg"));
  haySatelite[4] = false;
  
  p[5] = new Planeta(50,270,0.53, new Orbita(350 , -150 , 50),loadImage("planeta6.jpg"));
  haySatelite[5] = true;
  p[5].createSatelite(20,80 ,new Orbita(0,0, 180));
  
  p[6] = new Planeta(18,-69,0.83, new Orbita(260 , -40, 50),loadImage("planetaOscuro.jpg"));
  haySatelite[6] = false;
  
  p[7] = new Planeta(10,20,0.93, new Orbita(340 , 100, 50),loadImage("venusmap.jpg"));
  haySatelite[7] = false;
  
}

void mouseMoved() {
  naveX = mouseX;
  naveY = mouseY;
}

void mouseWheel(MouseEvent event) {
  naveZ += 10*event.getCount();
  
}
