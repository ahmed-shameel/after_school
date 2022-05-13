import 'package:after_school/components/custom_expanded_panel.dart';
import 'package:after_school/screens/profile/components/profile_picture.dart';
import 'package:after_school/screens/profile/components/user/user.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';

class Body extends StatefulWidget {
  User user;
  Body({required this.user});
  @override
  BodyState createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {

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
                    profilePhoto: widget.user.profilePhoto,
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
                                subtitle: Text(
                                    widget.user.firstName + " " + widget.user.lastName),
                              ),
                              ListTile(
                                title: Text("About Me"),
                                subtitle: Text(widget.user.aboutMe),
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
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFF519580),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                          child: Text(
                            'Logout',
                            textAlign: TextAlign.center,
                          )),
                    ),
                    onTap: () {
                      //TODO:LOGOUT;
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

