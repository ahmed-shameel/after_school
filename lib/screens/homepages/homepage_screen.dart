import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import 'package:after_school/screens/homepages/components/body.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}
