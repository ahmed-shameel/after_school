import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pub/components/body.dart';

class PubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}