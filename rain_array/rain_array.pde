//ArrayList<Raindrop> raindrops = new ArrayList();  
Raindrop[] drops = new Raindrop[500];

void setup() {
  size(1024, 768);
  background(0);
    for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrop();
    }
}

void draw() {
  background(0);
  for (int i = 0; i < drops.length; i++){
    drops[i].display();
    drops[i].pour();
  }
  makeOneRaindrop(); 
  
  drops[i] = new Raindrop();
 // removeRaindrop();
}

void makeOneRaindrop() {

  float randSize = random(10, 20);
  float randXpos = random(0, 1024);
  float randYspeed = random(8, 15);
  boolean isAlive;

  Raindrop drop1 = new Raindrop(randSize, randXpos, 0, randYspeed);
  
  raindrops.add( drop1 );
  
}

// ========================================================================

class Raindrop {
  float size;   // size/length of raindrop (randomized for each drop)
  float xpos;   // X position of raindrop (randomized for each drop)
  float ypos;   // Y position of raindrop (starts at 0, increases)
  float yspeed; // Y speed of raindrop (randomized for each drop)
  boolean isAlive; 


Raindrop(float tempSize, float tempXpos, float tempYpos, float tempYspeed) {
  size = tempSize;
  xpos = tempXpos;
  ypos = tempYpos;
  yspeed = tempYspeed;

}
  
void display() {
    stroke(255); // Draw raindrop
    line(xpos, ypos, xpos, (ypos + size));
    
    //stroke(0); // Draw black line after Raindrop
    //line(xpos, (ypos - size), xpos, ypos);

    
  }
  
void pour() {
  ypos = ypos + yspeed;
  
}

//void removeRaindrop() {
  //if (ypos + 100) >= height {
  //  for(int i= raindrops.size()-1; i > 0; i--) 
    //  if(isAlive!=true) remove(i);  
 // }
//}

}

// class ==================================================================

  
  