import 'package:after_school/contants.dart';
import 'package:flutter/material.dart';
import 'package:after_school/screens/homepages/components/body.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}

