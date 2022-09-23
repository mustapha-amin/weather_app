// {
//      "coord": {
//        "lon": -0.13,
//        "lat": 51.51
//      },
//      "weather": [
//        {
//          "id": 300,
//          "main": "Drizzle",
//          "description": "light intensity drizzle",
//          "icon": "09d"
//        }
//      ],
//      "base": "stations",
//      "main": {
//        "temp": 280.32,
//        "pressure": 1012,
//        "humidity": 81,
//        "temp_min": 279.15,
//        "temp_max": 281.15
//      },
//      "visibility": 10000,
//      "wind": {
//        "speed": 4.1,
//        "deg": 80
//      },
//      "clouds": {
//        "all": 90
//      },
//      "dt": 1485789600,
//      "sys": {
//        "type": 1,
//        "id": 5091,
//        "message": 0.0103,
//        "country": "GB",
//        "sunrise": 1485762037,
//        "sunset": 1485794875
//      },
//      "id": 2643743,
//      "name": "London",
//      "cod": 200
//      }

class Weather {
  String? cityName;
  double? lon;
  double? lat;
  double? temp;
  int? pressure;
  int? humidity;
  String? decription;
  String? iconUrl;
  Weather({
    this.cityName,
    this.lon,
    this.lat,
    this.temp,
    this.humidity,
    this.decription,
    this.pressure,
    this.iconUrl,
  });

  String get icon {
    return 'http://openweathermap.org/img/wn/$iconUrl@2x.png';
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      lon: json['coord']['lon'],
      lat: json['coord']['lat'],
      temp: json['main']['temp'],
      humidity: json['main']['humidity'] as int?,
      pressure: json['main']['pressure'] as int?,
      decription: json['weather'][0]['description'],
      iconUrl: json['weather'][0]['icon'],
    );
  }
}
