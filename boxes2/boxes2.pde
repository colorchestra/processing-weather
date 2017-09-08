Row[] rows = new Row [4];
String[] binarytemps = new String[7];
/*
char[] morning = new char[7];
char[] noon = new char[7];
char[] evening = new char[7];
char[] night = new char[7];
*/
char[] binarray = new char[7];
int[] temperatures = { 10, 20, 30, 5, };

int border = 5;
int boxsize = 75;

void setup() {
  size(565,565);
  background(100);
  fill(255);
  
  for (int i = 0; i < rows.length; i++) {
    rows[i] = new Row((i * (border + boxsize)), 20);
    
  }
  
}


void draw() {

  for (int i = 0; i < 4; i++) {
    rows[i].setTemperature(i);    
    rows[i].binarize();
    rows[i].display();
  }
}



public class Row {
  int temperature;
  int ypos;
  
  Row(int ypos_, int temperature_) {
    ypos = ypos_;
    temperature = temperature_;
  }

  void display() {
    for (int i = 0; i < 7; i++) {
      if (binarray[i] == '1') {
        fill(255,255,0);
      }
      else {
        fill(0);
      }
      rect(border + i * (border + boxsize), border, boxsize, boxsize);
    }
  }
    
  void binarize() {
      binarray = (binary(temperature, 7)).toCharArray();
//    println(binarray);
    }
    
  int setTemperature(int i) {
    temperature = temperatures[i];
    print(temperature);
    return temperature;
  
  }
}