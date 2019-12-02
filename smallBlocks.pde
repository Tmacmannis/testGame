class smallBlock{

  float posX = 800;
  float velX = 0;
  int size = 30;
  
  smallBlock(){
  }
  
  void show(){
    fill(0);
    rectMode(CENTER);
    rect(posX, height - 100 - size, size, size*2);
  }
  
  void move(float speed){
    posX -= speed;
  }
  
}
