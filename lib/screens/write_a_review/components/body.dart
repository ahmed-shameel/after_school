import 'package:after_school/components/background_without_logo.dart';
import 'package:after_school/components/custom_rating_bar.dart';
import 'package:after_school/screens/thank_you/thank_you_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Text('Write a review', style: TextStyle(fontSize: 20)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomRatingBar(
            starSize: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 150,
            width: 400,
            child: TextField(
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white54,
                labelText: 'Write a review...',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(20, 50),
                  shape: StadiumBorder(),
                  primary: Color(0xFF519580),
                ),
                child: FittedBox(
                  child: Text(
                    'Cancel ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 50),
                  shape: StadiumBorder(),
                  primary: Color(0xFF519580),
                ),
                child: FittedBox(
                  child: Icon(
                    CupertinoIcons.camera,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                onPressed: () {
                  //TODO : OPEN CAMERA ROLL OR TAKE A PIC
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(20, 50),
                  shape: StadiumBorder(),
                  primary: Color(0xFF519580),
                ),
                child: FittedBox(
                  child: Text(
                    'Submit ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                onPressed: () {
                  //TODO: SUBMIT REVIEW
                  //if successful:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThankYouScreen(),
                          settings: RouteSettings(name: 'thankYou')));
                },
              ),
            ],
          ),
        )
      ],
    )));
  }
}
