import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import 'calendar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Calendar(),
    );
  }
}
