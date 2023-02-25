class Face {
  PVector normal;
  color c;
  float size;
  int cubeIndex;
  
  Face(PVector normal, color c, float size, int cubeIndex){
   this.normal = normal;
   this.c = c;
   this.size = size;
   this.cubeIndex = cubeIndex;
  }
  
  void show(){
    pushMatrix();
    push();
    fill(c);
    noStroke();
    rectMode(CENTER);
    translate(
             (cubeIndex%3*CUBESIZE)-(CUBESIZE/2*normal.x+CUBESIZE)-0.01*cubeIndex , 
             (CUBESIZE/2*normal.y)-cubeIndex/9*CUBESIZE-0.01*cubeIndex, 
             (CUBESIZE/2*normal.z)-(cubeIndex%9/3*CUBESIZE)+CUBESIZE-0.01*cubeIndex); 
   if (abs(normal.x) > 0) {
     rotateY(HALF_PI);
   } else if (abs(normal.y) > 0) {
     rotateX(HALF_PI);
   } 
   square(0,0,size);
   pop();
   popMatrix();
  }
  
  void updateSize(int size){
    this.size = size;
  }
  
  void rotateFacesX(float an){
   float angle = -HALF_PI;
   PVector v2 = new PVector();
   v2.y = round(normal.y * cos(angle) - normal.z * sin(angle));
   v2.z = round(normal.y * sin(angle) + normal.z * cos(angle));
   v2.x = round(normal.x);
   normal = v2;
  }
  
  void rotateFacesY(float an){
   float angle = -HALF_PI;
   PVector v2 = new PVector();
   v2.x = round(normal.x * cos(angle) - normal.z * sin(angle));
   v2.z = round(normal.x * sin(angle) + normal.z * cos(angle));
   v2.y = round(normal.y);
   normal = v2;
  }
  
  void rotateFacesZ(float an){
   float angle = -HALF_PI;
   PVector v2 = new PVector();
   v2.x = round(normal.x * cos(angle) - normal.y * sin(angle));
   v2.y = round(normal.x * sin(angle) + normal.y * cos(angle));
   v2.z = round(normal.z);
   normal = v2;
  }
  
}
