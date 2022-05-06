import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pubs_list/components/body.dart';

class PubsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}
