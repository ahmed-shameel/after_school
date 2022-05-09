import 'package:after_school/constants.dart';
import 'package:after_school/screens/map/components/body.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Body(),
    );
  }
}

