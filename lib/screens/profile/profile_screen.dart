import 'package:after_school/constants.dart';
import 'package:after_school/screens/edit_profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import '../profile/components/body.dart';
import '../user/components/user.dart';

class ProfileScreen extends StatelessWidget {
  User user;

  ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()));
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
      body: Body(user: user),
    );
  }
}
