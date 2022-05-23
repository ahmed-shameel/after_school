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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(30, 50),
            shape: StadiumBorder(),
            primary: Color(0xFF519580),
          ),
          child: FittedBox(
            child: Text(
              'Back ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName("reviews"));
          },
        ),
      ],
    )));
  }
}
