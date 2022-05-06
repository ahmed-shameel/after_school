import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      titleText: 'OnePub',
      child: Center(child: Container(child: Text('one pub page'),),)
    );
  }
}
