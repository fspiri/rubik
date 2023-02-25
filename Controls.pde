void keyPressed(){
  switch(key)
  {
    case ' ':
      println("aa");
      rotateZ(300);
      break;
     
    case 'f':
      rotateZ(CUBESIZE, 1);
      break;
    case'F':
      rotateZ(CUBESIZE, -1);
      break;
    case'l':
      rotateX(-CUBESIZE, 1);
      break;
    case 'r':
      rotateX(CUBESIZE, 1);
      break;
    case 'u':
      rotateY(-2*CUBESIZE, 1);
      break;
  }
  
}
