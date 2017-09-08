Row[] rows = new Row [4];
char[] binarray = new char[7];
int[] temperatures = { 10, 20, 30, 5, };

int border = 5;
int boxsize = 75;
int ypos = border;

void setup() {
  size(565,325);
  background(100);
  fill(255);
  
  for (int i = 0; i < rows.length; i++) {
    rows[i] = new Row();
    
  }
  
}


void draw() {

  for (int i = 0; i < 4; i++) {
    rows[i].setTemperature(i);    
    rows[i].binarize();
    rows[i].display();
    ypos = (ypos + border + boxsize);
  }
}

public class Row {
  int temperature;
  
  Row() {
  }

  void display() {
    for (int i = 0; i < 7; i++) {
      if (binarray[i] == '1') {
        fill(255,255,0);
      }
      else {
        fill(0);
      }
      rect(border + i * (border + boxsize), ypos, boxsize, boxsize);

    }
  }
    
  void binarize() {
      binarray = (binary(temperature, 7)).toCharArray();
    }
    
  int setTemperature(int i) {
    temperature = temperatures[i];
    return temperature;
  
  }
}