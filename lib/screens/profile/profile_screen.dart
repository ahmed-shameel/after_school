import 'package:after_school/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}
