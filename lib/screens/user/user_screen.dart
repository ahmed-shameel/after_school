import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../user/components/body.dart';
import '../user/components/user.dart';

class UserScreen extends StatelessWidget {
  User user;

  UserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: const Icon(
            Icons.keyboard_backspace_sharp,
            color: iconColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Body(
        user: user,
      ),
    );
  }
}
