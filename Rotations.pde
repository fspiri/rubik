float speed = 0.5;

void rotateZ(int value, int dir){
  for (int i=0; i<cubeList.size(); i++){
    Cube qb = cubeList.get(i);
    if(qb.getZ() == value){
      qb.cube.translate(-450*dir, 450*dir, 0);
      qb.cube.rotateZ(dir * HALF_PI); 
      qb.cube.translate(150*dir, 150*dir);
      for(Face f : qb.faces)
        f.rotateFacesZ(HALF_PI);
    }
  }
}
void rotateX(int value, int dir){
  for (int i=0; i<cubeList.size(); i++){
    Cube qb = cubeList.get(i);
    if(qb.getX() == value){
      qb.cube.translate(0, 450*dir, -450*dir);
      qb.cube.rotateX(-HALF_PI); 
      qb.cube.translate(0, 150*dir, 150*dir);
      for(Face f : qb.faces)
        f.rotateFacesX(HALF_PI);
    }
  }
}
  void rotateY(int value, int dir){
    for (int i=0; i<cubeList.size(); i++){
    Cube qb = cubeList.get(i);
    if(qb.getY() == value){
      qb.cube.translate(-150*dir, 0, 150*dir);
      qb.cube.rotateY(-HALF_PI); 
      qb.cube.translate(150*dir, 0, 150*dir);
      for(Face f : qb.faces){
        f.rotateFacesY(6); 
      }
    }
  }
  
}
