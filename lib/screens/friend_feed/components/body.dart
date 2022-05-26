import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const Background(
        child: SingleChildScrollView(
      child: Center(
        child: Text('friend feed'),
      ),
    ));
  }
}
