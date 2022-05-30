import 'package:after_school/components/custom_expanded_panel.dart';
import 'package:after_school/components/profile_picture.dart';
import 'package:after_school/screens/homepages/homepage_screen_2.dart';
import 'package:after_school/screens/user/components/user.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import '../../homepages/homepage_screen.dart';

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
                                title: Text("Username"),
                                subtitle: Text(widget.user.username),
                              ),
                              ListTile(
                                title: Text("About Me"),
                                subtitle: Text(widget.user.aboutMe),
                              ),
                              CustomExpandedPanel(
                                user: widget.user,
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
                        Text(
                          'Logout ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ]),
                    ),
                    onPressed: () {
                      //TODO: logout;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageScreen()));
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
