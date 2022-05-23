import 'package:after_school/constants.dart';
import 'package:after_school/screens/edit_profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import '../profile/components/body.dart';
import '../user/components/user.dart';

class ProfileScreen extends StatelessWidget {

  User? user;

  ProfileScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   User newUser = User(username: 'username', password: 'pass', lastName: 'lst', email: 'mail', firstName: 'first');

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit_outlined,
              color: iconColor,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
            },
          )
        ],
        backgroundColor: appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
     body: Body(user: newUser),
    );
  }
}
