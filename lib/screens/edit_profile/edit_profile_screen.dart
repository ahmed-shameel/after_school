import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../edit_profile/components/body.dart';
import '../user/components/user.dart';

class EditProfileScreen extends StatelessWidget {
  User? user;

  EditProfileScreen({this.user});

  @override
  Widget build(BuildContext context) {
    User newuser = User(
      username: 'username',
      lastName: 'lstnme',
      firstName: 'frst',
      email: 'mail',
      password: 'pass',
      reviews: [],
      friends: [],
    );

    return Scaffold(
      backgroundColor: primaryColor,
      body: Body(
        user: newuser,
      ),
    );
  }
}
