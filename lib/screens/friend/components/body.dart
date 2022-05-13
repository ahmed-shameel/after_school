import 'package:after_school/components/custom_expanded_panel.dart';
import 'package:after_school/screens/profile/components/profile_picture.dart';
import 'package:after_school/screens/profile/components/user/user.dart';
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
                              CustomExpandedPanel(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF519580),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                          child: Text(
                        'Remove friend',
                        textAlign: TextAlign.center,
                      )),
                    ),
                    onTap: () {
                      //TODO: REMOVE FRIEND;
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
