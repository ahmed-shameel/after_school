import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../check-in/components/body.dart';
import '../pub/components/pub.dart';

class CheckInScreen extends StatelessWidget {
  Pub pub;

  CheckInScreen({
    Key? key,
    required this.pub,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Check-in', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
      body: Body(pub: pub,),
    );
  }
}
