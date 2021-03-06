import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pub/components/pub.dart';
import '../review/components/body.dart';

class ReviewScreen extends StatelessWidget {
  Pub pub;

  ReviewScreen({Key? key, required this.pub}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: Text(
          pub.name,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.keyboard_backspace_sharp,
            color: iconColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Body(
        pub: pub,
      ),
    );
  }
}
