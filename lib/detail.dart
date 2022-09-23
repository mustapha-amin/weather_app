import 'dart:async';

import 'package:flutter/material.dart';
import '/http/http_service.dart';
import '/models/weather.dart';

class DetailPage extends StatefulWidget {
  String? cityName;
  DetailPage({Key? key, this.cityName}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<Weather> weather;

  @override
  void initState() {
    weather = HttpService.getWeatherInfo(widget.cityName!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber[50],
        elevation: 0,
      ),
      backgroundColor: Colors.amber[50],
      body: FutureBuilder(
        future: weather,
        builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
          if (snapshot.hasData) {
            Weather weather = snapshot.data!;
            return Center(
              child: Column(
                children: [
                  Image.network(
                    weather.icon,
                  ),
                  Text(
                    weather.cityName!,
                    style: TextStyle(fontSize: 40),
                  ),
                  Text("lat: " +
                      weather.lat.toString() +
                      "  long: " +
                      weather.lon.toString()),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weather.temp!.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // oops i don't have a degree symbol
                      Text("o", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    weather.decription!,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Humidity level: " + weather.humidity.toString() + "%",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
