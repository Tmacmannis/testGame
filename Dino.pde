class Dino {
  float posY = 0;
  float velY = 0;
  float gravity = .5;
  float speed = 5;
  
  int size = 20;
  
  Dino(){
  }
  
  void show(){
    fill(0);
    rectMode(CENTER);
    rect(50, height - 100 - (posY +size), size, size*2);
  }
  
  void move(){
    posY += velY;
    
    if (posY >0) {
      velY -= gravity;
    } else{
      velY = 0;
      posY = 0;
    }
  
  }
}
