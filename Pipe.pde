class Pipe{
  float w;
  float c;
  float x;
  float bottomy;
  float gap;
  float topy;
  
  //constructor
  Pipe(float X){
    w = 60;
    x = X;
    c = random(150,height-250);
    gap = 200;
    bottomy = c+gap/2;
    topy = c-gap/2;

    
  }
  
  void update(Bird player){
    x-=speed;
    if (x==player.x){
      if(alive){ 
        score++; 
      }
    }
    
  }
  
  void show(){
    fill(0,255,0);
    image(pipebottom,x,bottomy);
    image(pipetop,x,topy-pipetop.height);
    //rect(x,0,w,topy);//top pipe
  }
  
  
  
  boolean hit(Bird player){ 
    if((player.x + bird1.width > x)&&(player.x<x+w)){//if x inline
      if(player.y+bird1.height>bottomy){//bottom pipe
        return true;
      }else if(player.y<topy){//top pipe
        return true;
      }
    }
    return false;
  }
 
  
  boolean offscreen(){
    if(x<-w){
      return true; 
    }
    return false;
  }
}
