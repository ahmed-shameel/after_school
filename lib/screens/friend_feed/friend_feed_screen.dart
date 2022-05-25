import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../friend_feed/components/body.dart';

class FriendsFeedScreen extends StatelessWidget {
  const FriendsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Feed',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(),
    );
  }
}
