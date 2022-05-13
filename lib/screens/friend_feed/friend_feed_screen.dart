import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../friend_feed/components/body.dart';

class FriendsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(),
    );
  }
}
