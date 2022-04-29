import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user/user.dart';
import '../user/user_preferences.dart';
import '../widgets/profile_page_appbar.dart';
import '../widgets/profile_picture.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      backgroundColor: Color(0xFF56AB91),
      body: ListView( children: [
        Container(
          child: Stack(children: [
            Positioned(
                top: -20.0,
                left: -50.0,
                child: Image(
                  image: AssetImage('assets/images/ellipse1.png'),
                )),
            Positioned(
                top: -90.0,
                left: 10,
                child: Image(
                  image: AssetImage('assets/images/ellipse1.png'),
                )),
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(CupertinoIcons.back)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      ProfileWidget(
                        imagePath: user.imagePath,
                        onClicked: () {
                          //TODO : EDIT PROFILE PICTURE
                        },
                      ),
                      // const SizedBox(height: 24),
                      buildName(user),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pubs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Events',
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
}
