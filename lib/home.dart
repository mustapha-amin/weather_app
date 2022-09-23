import 'package:flutter/material.dart';
import 'package:weather_app/http/http_service.dart';
import '/detail.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[40],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                "Weatherie",
                style: GoogleFonts.aclonica(
                  fontSize: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  title: TextFormField(
                    controller: textEditingController,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (val) {
                      val != ''
                          ? Navigator.push(context,
                                  MaterialPageRoute(builder: (conetxt) {
                              return DetailPage(
                                cityName: textEditingController.text,
                              );
                            }))
                              .whenComplete(() => textEditingController.clear())
                          : null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'city name',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
