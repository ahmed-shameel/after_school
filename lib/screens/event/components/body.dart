import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import 'event.dart';

class Body extends StatefulWidget {
  Event event;
  Body({Key? key, required this.event}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(event);
}

class _BodyState extends State<Body> {
  final Event event;

  _BodyState(this.event);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      child: Center(
        child: Container(
          child: Text(event.title),
        ),
      ),
    ));
  }
}
