import 'package:after_school/screens/profile/components/profile_picture.dart';
import 'package:after_school/screens/profile/components/user/user_preferences.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';

class Body extends StatelessWidget {
  final user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Background(
      //titleText: 'Profile',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () {
                      //TODO : EDIT PROFILE PICTURE
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Information",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("Name"),
                                    subtitle: Text(user.name),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.my_location),
                                    title: Text("Location"),
                                    subtitle: Text(user.location),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.email),
                                    title: Text("Email"),
                                    subtitle: Text(user.email),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.phone),
                                    title: Text("Phone"),
                                    subtitle: Text(user.phone),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("About Me"),
                                    subtitle: Text(user.aboutMe),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
