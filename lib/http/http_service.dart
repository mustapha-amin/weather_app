import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/models/weather.dart';

const apiKey = '3aa323c09a6a5ae377c2c587250bf8fc';

class HttpService {
  static Future<Weather> getWeatherInfo(String cityName) async {
    final queryParams = {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    };

    var uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParams);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      throw (response);
    }
  }

  // static Future<Weather> getWeatherForecast(){
  //   var uri = Uri
  // }
}
