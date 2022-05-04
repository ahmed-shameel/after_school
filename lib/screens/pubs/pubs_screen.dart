import 'package:after_school/contants.dart';
import 'package:flutter/material.dart';
import '../pubs/components/body.dart';

class PubsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}
