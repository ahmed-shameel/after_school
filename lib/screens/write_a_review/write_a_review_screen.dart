import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pub/components/pub.dart';
import '../write_a_review/components/body.dart';

class WriteReviewScreen extends StatelessWidget {
  Pub pub;

  WriteReviewScreen({Key? key, required this.pub}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.keyboard_backspace_sharp),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          pub.pubName,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(),
    );
  }
}
