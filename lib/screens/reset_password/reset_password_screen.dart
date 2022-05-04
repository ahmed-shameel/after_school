import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import 'package:after_school/screens/reset_password/components/body.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}