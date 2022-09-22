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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Weatherie",
                style: GoogleFonts.aclonica(
                  fontSize: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: TextFormField(
                controller: textEditingController,
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (val) {
                  Navigator.push(context, MaterialPageRoute(builder: (conetxt) {
                    return DetailPage(
                      cityName: textEditingController.text,
                    );
                  })).whenComplete(() => textEditingController.clear());
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  hintText: 'city name',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
