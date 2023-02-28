Bird player;
Pipe obstacle1;
Pipe obstacle2;
Floor floor1;
Floor floor2;
boolean end = false;
int count = 0;
boolean canflap = true;
float gravity;
float speed;
boolean alive = true;
boolean die = false;
int score = 0;
PImage bird1;
PImage bird2;
PImage bg;
PImage floor;
PImage pipetop;
PImage pipebottom;
PFont font;

void setup(){
  size(600,800);
  noStroke();
  fill(255);
  textAlign(CENTER);
  bird1 = loadImage("bird1.png");
  bird1.resize(68,48);
  bird2 = loadImage("bird2.png");
  bird2.resize(68,48);
  bg = loadImage("bg.png");
  floor = loadImage("fg.png");
  pipetop = loadImage("pipe2.png");
  pipetop.resize(60,0);
  pipebottom = loadImage("pipe1.png");
  pipebottom.resize(60,0);
  player = new Bird(150,height/2);
  obstacle1 = new Pipe(width);
  obstacle2 = new Pipe(1.5*width+30);
  floor1 = new Floor(0);
  floor2 = new Floor(width);
  font = createFont("flappybirdfont.TTF",64);
  textFont(font);
  
}

void keyPressed(){
  if(key==' '){
    if(alive){
      if(canflap){
        player.flap();
        gravity = 0.7;//only start moving when space pressed for the first time
        speed = 5;
        canflap = false;//change to true and hold space for fun time
      }
    }
  }
}

void keyReleased(){
  if(key==' '){
    canflap = true; 
  }
}

void draw(){
  if(end==false){
    image(bg,0,0);
    //background(0,160,255);
    obstacle1.update(player);
    obstacle1.show(); 
    obstacle2.update(player);
    obstacle2.show(); 
    floor1.update();
    floor1.show();
    floor2.update();
    floor2.show();
    player.update();
    player.show();
  
      
    if((obstacle1.hit(player))||(obstacle2.hit(player))||(floor1.hit(player))||(floor2.hit(player))){
        speed = 0;
        alive = false;
    }
      
    if (obstacle1.offscreen()){
        obstacle1 = new Pipe(width);
    }
    if (obstacle2.offscreen()){
        obstacle2 = new Pipe(width);
    }
  
    if(die){
      fill(255);
  
      String[] lines = loadStrings("High_score.txt");
      if (score>int(lines[0])){
        String[] data = new String[1];
        data[0] = str(score);
        saveStrings("High_score.txt",data);
        lines[0] = data[0];
        textSize(32);
        text("New High Score!",width/2,300);
      }
      textSize(64);
      text("Your Score: "+score,width/2,128);
      text("High Score: "+lines[0],width/2,256);
  
      if(score>=10){
        delay(3);
        end = true;
      }else{
        noLoop(); 
      }
      
    }else{
      fill(255);
      textSize(48);
      text(score,width/2,48); 
    }
  
  }else{
    textSize(32);
    noStroke();
    fill(0,count);
    if (count<=25){
      rect(0,0,width,height); 
      delay(100);
      count++;
    }else{
      delay(1);
      fill(255);
      text("Thankyou for playing\n you got a very high score ",width/2,128);
      noLoop();
    }
  }
}
