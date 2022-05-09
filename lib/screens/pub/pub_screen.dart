import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pub/components/body.dart';
import 'components/pub.dart';

class PubScreen extends StatelessWidget {
  final Pub pub;

  const PubScreen({
    Key? key,
    required this.pub,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(
        pub: pub,
      ),
    );
  }
}
