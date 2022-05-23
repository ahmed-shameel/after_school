import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pub/components/body.dart';
import 'components/pub.dart';

class PubScreen extends StatelessWidget {
  final Pub pub;

  const PubScreen({
    Key? key,
    required this.pub,
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
        title: Text(
          pub.pubName,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(
        pub: pub,
      ),
    );
  }
}
