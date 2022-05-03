import 'package:after_school/components/back_to_login.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF56AB91),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 200),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('The map :)'), Text('You are a guest!'), BackToLogin()]),
        ));
  }
}

