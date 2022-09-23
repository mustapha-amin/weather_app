import 'package:flutter/material.dart';
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
      backgroundColor: Colors.grey[300],
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
                style: GoogleFonts.lato(
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10,),
              child: Card(
                elevation: 2,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: 
                   TextFormField(
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
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'city name',
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
