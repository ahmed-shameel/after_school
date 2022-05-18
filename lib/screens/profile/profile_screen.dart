import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../profile/components/body.dart';
import 'components/user/user.dart';

class ProfileScreen extends StatelessWidget {

  User? user;

  ProfileScreen({this.user});

  @override
  Widget build(BuildContext context) {

//    User newuser = User(username: 'username');

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_outlined,
              color: iconColor,
            ),
            onPressed: () {
              // TODO EDIT PROFILE
            },
          )
        ],
        backgroundColor: appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
 //     body: Body(user: newuser,),
    );
  }
}
