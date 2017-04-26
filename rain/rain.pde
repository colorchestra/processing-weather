void setup() {
  size(1024, 768);
  background(0);
  

}

class Raindrop {
  float size;   // size/length of raindrop (randomized for each drop)
  float xpos;   // X position of raindrop (randomized for each drop)
  float ypos;   // Y position of raindrop (starts at 0, increases)
  float yspeed; // Y speed of raindrop (randomized for each drop)


Raindrop(float tempSize, float tempXpos, float tempYpos, float tempYspeed) {
  size = tempSize;
  xpos = tempXpos;
  ypos = tempYpos;
  yspeed = tempYspeed;

}
  
void display() {
    stroke(255); // Draw raindrop
    line(xpos, ypos, xpos, (ypos + size));
    
    stroke(0); // Draw black line after Raindrop
    line(xpos, (ypos - size), xpos, ypos);

    
  }
  
void pour() {
  ypos = ypos + yspeed;
  
}

}

  // The following 5 lines should be exectued every iteration to make many raindrops, but if I put this block into draw() it doesn't seem to work

  float randSize = random(10, 20);
  float randXpos = random(0, 1024);
  float randYspeed = random(3, 10);

  Raindrop drop1 = new Raindrop(randSize,randXpos,0,randYspeed);
  
  

void draw() {
  
  drop1.display();
  drop1.pour();
  
    
  
}