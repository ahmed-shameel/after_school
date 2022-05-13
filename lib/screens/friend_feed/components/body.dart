import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Text('friend feed'),
            ),
          ),
        ));
  }
}
