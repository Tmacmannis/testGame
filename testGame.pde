Dino dino;
float minObstacleDistance = 40;
int currentObstacleCount = 0;
boolean gameOn = true;
int numIntersections = 0;
int score = 0;
int bestScore = 0;
float gameSpeed = 4;


ArrayList<smallBlock> obstacles = new ArrayList<smallBlock>();
//---------------------------------------------------------------------------------------------------------------------------------------------------------
void setup(){
  size(800,400);
  dino = new Dino();
  frameRate(75);
    
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
void draw(){
  background(255);
  stroke(0);
  line(0, height - 100, width, height -100);
  dino.move();
  dino.show();
  updateObstacles();
  checkCollisions();
  updateScore();
  gameSpeed += .002;
  minObstacleDistance -= .0002;
  
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
void keyPressed(){
  switch(key){
    case ' ':
      //dino.velY = 10;
      setVelY();
      break;
    case ENTER:
      resetGame();
      break;
  }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
void setVelY(){
  if(dino.posY == 0){
    dino.velY = 10;
  } else {
    println("jumped too early");
  }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
void updateObstacles(){
  //do something
  currentObstacleCount++;
  float randNum = int(random(20));
  if(randNum ==1.0  && currentObstacleCount > minObstacleDistance){
    addObstacle();
    currentObstacleCount = 0;
  }
  
  moveObstacles();
  
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
void addObstacle(){
  smallBlock temp = new smallBlock();//floor(random(3)));
  obstacles.add(temp);
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------
void moveObstacles(){
  if(gameOn){
    for (int i =  0; i< obstacles.size(); i++) {
      obstacles.get(i).move(gameSpeed);
      obstacles.get(i).show();
      if (obstacles.get(i).posX < 0) { 
        obstacles.remove(i);
        i--;
      }
    }
  }
   //<>//
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------

void checkCollisions(){

  if (obstacles.size() > 0 && gameOn){
    //println(dino.posY);
    for (int i =  0; i< obstacles.size(); i++) {
      if (obstacles.get(i).posX < 400){
        
        //obstacle is x1 and dino is x2
        float x1 = obstacles.get(i).posX;
        float w1 = obstacles.get(i).size;
        float x2 = 50;
        float w2 = dino.size;
        float y1 = height - 100 - obstacles.get(i).size;
        float h1 = obstacles.get(i).size*2;
        float y2 = (height - 100 - (dino.posY +dino.size));
        float h2 = dino.size*2;
        
        
        if(x1 + w1 < x2 || x2 + w2 < x1 || y1 + h1 < y2 || y2 + h2 < y1){
          
        } else {
          gameOn = false;
          println("Collision!");
        }
      } 
    } 
  } 
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------
void updateScore(){
  if(gameOn){
    textSize(32);
    score++;
    text("Score: " + score, 10, 30);
    text("Best: " + bestScore, 10, 60);
  } else {
    textSize(32);
    fill(255, 0, 0);
    text("Score: " + score, 10, 30);
    text("Best: " + bestScore, 10, 60);
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------
void resetGame(){
  println("reset");
  gameSpeed = 4;
  numIntersections = 0;
  gameOn = true;
  minObstacleDistance = 40;
  obstacles.clear();
  if (score > bestScore){
    bestScore = score;
  }
  score = 0;
}
