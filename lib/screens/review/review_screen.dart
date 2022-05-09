import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../review/components/body.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}