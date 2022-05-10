import 'package:after_school/components/background_without_logo.dart';
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
        Text(
          'Thank you for your review.',
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text('Your review will now be available for others to see.',
              style: TextStyle(fontSize: 18)),
        ),
        Container(
          height: 300,
          width: 500,
          child: Image(
            image: AssetImage('assets/images/logo_without_appName.png'),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        GestureDetector(
          child: Container(
            height: 40,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xFF519580),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
                child: Text(
              'Back',
              textAlign: TextAlign.center,
            )),
          ),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName("reviews"));
          },
        ),
      ],
    )));
  }
}
