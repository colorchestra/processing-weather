ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();  
int rainIntensity = 4;

void setup() {
  size(1024, 768);
  background(0);
}


void draw() {
  background(0);
  for (Raindrop drop : raindrops) {
    drop.display();
    drop.pour();
  }
  for (int i = raindrops.size() - 1; i >= 0; i--) {     // Iterate through the list backwards to remove drops out of bounds
    Raindrop j = raindrops.get(i);
    boolean checkAlive = j.checkAlive();
    if(checkAlive!=true) raindrops.remove(j);
  }

  for (int i = 0; i < rainIntensity; i++) {             // The rainItensity var defines how many drops are created each iteration
  makeOneRaindrop();  
  }
  
  System.out.println(raindrops.size()); // DEBUG
}

void makeOneRaindrop() {

  float randSize = random(10, 20);
  float randXpos = random(0, 1024);
  float randYspeed = random(10, 15);

  Raindrop drop1 = new Raindrop(randSize, randXpos, 0, randYspeed);
  
  raindrops.add( drop1 );
  
}

// ========================================================================

public class Raindrop {
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
  
void display() {                                // Draw raindrop in white
    stroke(255); 
    line(xpos, ypos, xpos, (ypos + size));
    
  }
  
void pour() {
  ypos = ypos + yspeed;
  isAlive = true;
  if (ypos > height + 100) isAlive = false;    // Move raindrop according to its speed

 
  }
  
boolean checkAlive() {
  if (isAlive) {
    return true;  
   }
   else {
     return false;
   }
}

}

// class ==================================================================

  
  