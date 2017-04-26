void setup() {
  size(1024, 768);
  background(0);
  

}

class Raindrop {
  float size;
  float xpos;
  float ypos;
  float yspeed;


Raindrop(float tempSize, float tempXpos, float tempYpos, float tempYspeed) {
  size = tempSize;
  xpos = tempXpos;
  ypos = tempYpos;
  yspeed = tempYspeed;

}
  
void display() {
    stroke(200);
    line(xpos, ypos, xpos, size);
    //rect(xpos,ypos,1,size);
    
  }
  
void pour() {
  ypos = ypos + yspeed;
  
}

}


void draw() {
  
  float randSize = random(10, 20);
  float randXpos = random(0, 1024);
  float randYspeed = random(3, 10);

  // background(0);
  Raindrop drop1 = new Raindrop(randSize,randXpos,0,randYspeed);
  drop1.pour();
  drop1.display();

  
  
}