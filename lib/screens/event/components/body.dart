import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import 'event.dart';

class Body extends StatefulWidget {
  Event event;
  Body({Key? key, required this.event}) : super(key: key);

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
          child: Text(widget.event.title),
        ),
      ),
    ));
  }
}
