Row[] rows = new Row [4];
char[] binarray = new char[7];
int[] temperatures = { 10, 20, 30, 5, };
String[] daytimes = { "06:00:00", "12:00:00", "18:00:00", "00:00:00" };

int border = 5;
int boxsize = 75;
int ypos = border;
int weatherId;
int weatherTemperature;
String dateTomorrow = "2017-09-11";
color rowColor;
JSONObject jsonData;
JSONArray weatherData;
String weatherTime;
String apiKey = "REMOVED";
String apiQuery = "http://api.openweathermap.org/data/2.5/forecast?id=2925533&units=metric&" + apiKey;

void setup() {
  size(565, 325);
  background(100);
  fill(255);

  for (int i = 0; i < rows.length; i++) {
    rows[i] = new Row();
  }

  weatherData = getWeatherData();
  
  
  weatherId = getWeatherIdFromArr(0);
  println("Forecast weather code is " + weatherId);
  weatherTime = getWeatherTimeFromArr(0);
  println("Time of forecast is " + weatherTime);
  weatherTemperature = getWeatherTemperatureFromArr(0);
  println("Forecast temperature is " + weatherTemperature);

}


/////////////// END SETUP ////////////////////////


JSONArray getWeatherData() {
  jsonData = loadJSONObject(apiQuery);
  weatherData = jsonData.getJSONArray("list");
  return(weatherData);
}


int getWeatherIdFromArr(int objectNr) {
  JSONObject idObj = weatherData.getJSONObject(objectNr);       // Temporary
  JSONArray idArr = idObj.getJSONArray("weather");  // Temporary
  idObj = idArr.getJSONObject(0);    // Temporary
  weatherId = idObj.getInt("id");               // Temporary
  return(weatherId);
}


String getWeatherTimeFromArr(int objectNr) {
  JSONObject timeObj = weatherData.getJSONObject(objectNr);
  String dttxt = timeObj.getString("dt_txt");
  return(dttxt);
}


int getWeatherTemperatureFromArr(int objectNr) {
  JSONObject tempObj = weatherData.getJSONObject(objectNr);
  tempObj = tempObj.getJSONObject("main");
  float tempFloat = tempObj.getFloat("temp");
  int tempInt = round(tempFloat);
  return(tempInt);
}

void getTomorrowsWeather() {
  for (int i = 0; i < 40; i++) {
    String time = getWeatherTimeFromArr(i);
    if (time.contains("00:00:00")) {
      print(time + "\n");
    }
    
  }
}
void draw() {

  for (int i = 0; i < 4; i++) {
    rows[i].setTemperature(i);    
    rows[i].binarize();
    //    rows[i].getColor();
    //    rowColor = int(random(255));
    rowColor = rows[i].getColor();
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
        //        fill(255,255,0);
        fill(rowColor);
      } else {
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

  color getColor() {
    return(255);
  }
}