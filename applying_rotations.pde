import peasy.*;
PeasyCam cam;
PShape cube;
Cube[] qb;
int[] floor = new int[27];
ArrayList<Cube> cubeList;

Move[] allMoves = new Move[] {
  new Move(0,1,0,1), //0
  new Move(0,1,0,-1),//1
  
  new Move(0,-1,0,1),//2
  new Move(0,-1,0,-1),//3
  
  new Move(1,0,0,1),//4
  new Move(1,0,0,-1),//5
  
  new Move(-1,0,0,1),//6
  new Move(-1,0,0,-1),//7
  
  new Move(0,0,1,1),//8
  new Move(0,0,1,-1),//9
  
  new Move(0,0,-1,1),//10
  new Move(0,0,-1,-1)//11
};


int SPEED = 3;

static final int CUBESIZE = 300;
int index = -1 ;
int listCounter = 0;

ArrayList<Move> sequence = new ArrayList<Move>();
int counter = 0;
Move currentMove;




void setup(){
  //fullScreen(P3D);
  size(900, 900, P3D);
  frameRate(60);
  cam = new PeasyCam(this, width*3);
  smooth(16);
  
  cubeList = new ArrayList<Cube>();
  
  for (int i = 0; i<floor.length; i++){
    cubeList.add(new Cube(
                      (i%3*CUBESIZE) - (3/2*CUBESIZE), 
                      (-(int) i/9 * CUBESIZE), 
                      (CUBESIZE - (int) (i%9)/3 * CUBESIZE),
                      i) );
  }
  
  for(int i = 0; i < 10; i ++) {
  int r = int(random(allMoves.length));
  Move m = allMoves[r];
  sequence.add(m);
 }
 currentMove = sequence.get(counter);
}

void draw(){
  background(background);
  //fill(blue);
  noFill();
  lights();
  rotateX(-0.8);
  rotateY(0.6);
  rotateZ(0.1);
  
  strokeWeight(5);
  stroke(stroke);
  
  if(sequence.size()>=1){
  currentMove.update();
  if (currentMove.finished()) {
    if (counter < sequence.size()-1){
    counter++;
    currentMove = sequence.get(counter);
    currentMove.start();
    }
  }
  }
  
  
  
  if(frameCount%SPEED == 0 && listCounter++<floor.length){
    if(index++ < cubeList.size())
      cubeList.get(index).generateCube();
  }
  
  
  for(int a = 0; a<cubeList.size(); a++){
    Cube qb = cubeList.get(a);
    /*
    if(qb.getZ() == 300 && qb.getY() == 0){
      stroke(red);
    }
    else if(qb.getX() == -300 && qb.getY() == -300){
      stroke(green);
    }
    else if(qb.getY() == -600 && qb.getX() == -300){
      stroke(blue); 
    }
    else
    */
      stroke(stroke);
    if(qb.isVisible()){
        qb.updateCube();
    }
      
  }
  
}
