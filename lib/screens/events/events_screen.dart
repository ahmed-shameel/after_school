import 'package:after_school/contants.dart';
import 'package:flutter/material.dart';
import '../events/components/body.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}
