import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../write_a_review/components/body.dart';

class WriteReviewScreen extends StatelessWidget {
  WriteReviewScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(
            Icons.keyboard_backspace_sharp,
            color: iconColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Body(),
    );
  }
}
