import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF56AB91),
      body: Body(),
    );
  }
}
