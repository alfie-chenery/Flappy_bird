class Floor{
  float x;
  //constructor
  Floor(float X){
    x = X;
  }
  
  void update(){
    x -= speed;
    if (x<=-width){
      x=width;
    }
  }
  
  void show(){
    image(floor, x,height-100);
  }
  
  boolean hit(Bird player){
    if (player.y>=height-100){
      return true;
    }
    return false;
  }
  
}
