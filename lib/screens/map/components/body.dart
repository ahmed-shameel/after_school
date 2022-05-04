import 'package:after_school/components/background_without_logo.dart';
import 'package:flutter/material.dart';
import '../../../components/back_to_login.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      titleText: 'Map',
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('The map :)'), Text('You are a guest!'), BackToLogin()]),
            ),
          ],
        ),
      ),
    );
  }
}