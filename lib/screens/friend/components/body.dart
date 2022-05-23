import 'package:after_school/components/custom_expanded_panel.dart';
import 'package:after_school/components/profile_picture.dart';
import 'package:after_school/screens/user/components/user.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';

class Body extends StatelessWidget {
  User user;

  Body({required this.user});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: [
                  ProfilePic(
                    profilePhoto: user.profilePhoto,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          ...ListTile.divideTiles(
                            color: Colors.black,
                            tiles: [
                              ListTile(
                                title: Text("Name"),
                                subtitle:
                                    Text(user.firstName + " " + user.lastName),
                              ),
                              ListTile(
                                title: Text("About Me"),
                                subtitle: Text(user.aboutMe),
                              ),
                              CustomExpandedPanel(
                                user: user,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(20, 50),
                      shape: StadiumBorder(),
                      primary: Color(0xFF519580),
                    ),
                    child: FittedBox(
                      child: Row(children: [
                        Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                        ),
                        Text(
                          ' Remove friend',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ]),
                    ),
                    onPressed: () {
                      //TODO: remove friend;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
