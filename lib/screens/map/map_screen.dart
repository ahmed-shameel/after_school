import 'package:after_school/contants.dart';
import 'package:after_school/screens/map/components/body.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Body(),
    );
  }
}

