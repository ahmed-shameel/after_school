import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pub/components/pub.dart';
import '../review/components/body.dart';

class ReviewScreen extends StatelessWidget {
  final Pub pub;

  ReviewScreen({Key? key, required this.pub}) : super(key: key);
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
      body: Body(pub: pub),
    );
  }
}
