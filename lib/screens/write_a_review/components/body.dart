import 'package:after_school/components/background_without_logo.dart';
import 'package:after_school/screens/thank_you/thank_you_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Text('Write a review', style: TextStyle(fontSize: 20)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30,
              ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.white),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.white,
                  ),
                  empty: const Icon(
                    Icons.star_outline,
                    color: Colors.white,
                  )),
              onRatingUpdate: (value) {
                setState(() {
                  _ratingValue = value;
                });
              }),
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
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFF519580),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                      child: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                  )),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFF519580),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.camera,
                    size: 40,
                  )),
                ),
                onTap: () {
                  //TODO : OPEN CAMERA ROLL OR TAKE A PIC
                },
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFF519580),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                      child: Text(
                    'Submit',
                    textAlign: TextAlign.center,
                  )),
                ),
                onTap: () {
                  //TODO: SUBMIT REVIEW
                  //if successful:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThankYouScreen(),
                          settings: RouteSettings(name: 'thankYou')));
                },
              )
            ],
          ),
        )
      ],
    )));
  }
}
