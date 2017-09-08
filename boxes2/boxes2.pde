Row[] rows = new Row [4];
String[] binarytemps = new String[7];
char[] morning = new char[7];
char[] noon = new char[7];
char[] evening = new char[7];
char[] night = new char[7];
char[] binarray = new char[7];
String[] daytime = { "morning", "noon", "evening", "night" };


int border = 5;
int boxsize = 50;
int initializedRowCount;
int wurst;
String nothing;
String rowdaytime;

void setup() {
  int temperature0 = 10; /// DEBUG
  int temperature1 = 20; /// DEBUG
  int temperature2 = 30; /// DEBUG
  int temperature3 = 5;  /// DEBUG
 
  size(700,700);
  background(0);
  fill(255);
  
  for (int i = 0; i < rows.length; i++) {
    rows[i] = new Row((i * (border + boxsize)), 20, daytime[i]);
    
  }
  
}


void draw() {

  for (int i = 0; i < 4; i++) {
    String rowdaytime = daytime[i];
    print(rowdaytime);
    rows[i].binarize();
    rows[i].display();
  }
}



public class Row {
  int temperature;
  int ypos;
  String rowdaytime;
  
  Row(int ypos_, int temperature_, String rowdaytime_) {
    ypos = ypos_;
    temperature = temperature_;
    rowdaytime = rowdaytime_;
  }

  void display() {
    for (int i = 0; i < 7; i++) {
      if (binarray[i] == '1') {
        fill(255,255,0);
      }
      else {
        fill(0);
      }
      rect(i * (border + boxsize), 0, boxsize, boxsize);
    }
  }
    
  void binarize() {
      binarray = (binary(temperature, 7)).toCharArray();
    println(binarray);
    }
  void getTemperature() {
  
  }
}