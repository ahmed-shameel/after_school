import 'package:after_school/components/background_without_logo.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(child: Container(child: Text('Write a review'),),),
    );
  }
}
