import 'package:after_school/components/custom_expanded_panel.dart';
import 'package:after_school/components/profile_picture.dart';
import 'package:after_school/screens/user/components/user.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';

class Body extends StatelessWidget {
  User user;

  Body({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  ProfilePic(
                    profilePhoto: user.profilePhoto,
                  ),
                  const SizedBox(
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
                                title: const Text("Name"),
                                subtitle:
                                    Text(user.firstName + " " + user.lastName),
                              ),
                              ListTile(
                                title: const Text("About Me"),
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(20, 50),
                      shape: const StadiumBorder(),
                      primary: const Color(0xFF519580),
                    ),
                    child: FittedBox(
                      child: Row(children: const [
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
