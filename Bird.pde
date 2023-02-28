class Bird{
  float x;//y coord
  float y;
  float yvel;
  PImage current;
  
  //constructor
  Bird(float i, float j){
    x = i;
    y = j; 
    yvel = 0;
  }
   
  void flap(){
    yvel-=12; 
  }
   
  void update(){
    if(yvel>=0){
      current = bird1;
    }else{
      current = bird2; 
    }
    
    if(y<height-(current.height+100)){
      yvel+=gravity;
      y+=yvel;
    }else{
      yvel=0;
      y = height-(current.height+100);
      die = true;
    }
  }
  
  void show(){
    image(current,x,y);
  }
}
