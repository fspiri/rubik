public class Cube{
  PShape cube;
  float x;
  float y;
  float z;
  boolean show = false;
  int size = 0;
  boolean isFull = false;
  int cubeIndex;
  
  Face[] faces = new Face[6];
 
  Cube(int x, int y, int z, int index){
    this.x = x;
    this.y = y;
    this.z = z;
    this.cubeIndex = index;
    faces[0] = new Face(new PVector(0, 0, -1), blue, size, this.cubeIndex);
    faces[1] = new Face(new PVector(0, 0, 1), green, size, this.cubeIndex);
    faces[2] = new Face(new PVector(0, 1, 0), color(255,255,255), size, this.cubeIndex);
    faces[3] = new Face(new PVector(0, -1, 0), stroke, size, this.cubeIndex);
    faces[4] = new Face(new PVector(1, 0, 0), orange, size, this.cubeIndex);
    faces[5] = new Face(new PVector(-1, 0, 0), red, size, this.cubeIndex);
    
    
    cube = createShape(BOX, 100);
  }
 
  void generateCube(){
    this.show = true;
  }
 
  void updateCube(){
    if(frameCount >SPEED){
      if(size<CUBESIZE)
        size+= (SPEED);
    }
    if(this.cube.height < CUBESIZE){
     this.cube = createShape(BOX, size);
     this.cube.translate(x, y, z);
     this.cube.height = size;
    }
    shape(cube);
    
    
    for(Face f : faces){
      if(this.cube.height < CUBESIZE)
        f.updateSize(this.size);
      f.show();
    
    }
  } 
  void show(){
    show = true;
  } 
  void hide(){
    show = false;
  } 
  boolean isVisible(){
    return show; 
  } 
  float getX(){
    return this.x;
  }
  float getY(){
    return this.y; 
  }
  float getZ(){
    return this.z; 
  }
  void rotate(float value){
    this.cube.rotate(value);
  }
  void setX(float value){
    this.x = value;
  }
 void setY(float value){
    this.y = value; 
 }
 void setZ(float value){
   this.z = value; 
 }
}
