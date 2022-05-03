import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/profile_picture.dart';
import 'components/user/user_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 0;

  void _onItemTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  List<Widget> pages = [
    ProfileScreen(),
    //MapPage(),
    //Pubslistpage,
    //Eventspage,
  ];
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      backgroundColor: Color(0xFF56AB91),
      body: ListView(children: [
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
            Positioned(
                top: 15,
                left: 230,
                child: Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Column(
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
          ]),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(

        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFF56AB91),
        iconSize: 30,

        items: <BottomNavigationBarItem>[
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
        currentIndex: _currentIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
