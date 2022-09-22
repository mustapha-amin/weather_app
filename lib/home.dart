import 'package:flutter/material.dart';
import '/detail.dart';
import 'http/http_service.dart';
import '/models/weather.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Weatherie",
              style: GoogleFonts.aclonica (
                fontSize: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Card(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'city name',
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (conetxt) {
                return DetailPage(
                  cityName: textEditingController.text,
                );
              })).whenComplete(() => textEditingController.clear());
            },
            child: Text("Search"),
          )
        ],
      )),
    );
  }
}
