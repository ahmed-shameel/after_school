import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user/user_preferences.dart';
import '../widgets/profile_picture.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 0;

  void _onItemTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  List<Widget> pages = [
    const ProfilePage(),
    //apPage(),
    //Pubslistpage,
    //Eventspage,
  ];
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return Scaffold(
      backgroundColor: const Color(0xFF56AB91),
      body: ListView(children: [
        Stack(children: [
          const Positioned(
              top: -20.0,
              left: -50.0,
              child: Image(
                image: AssetImage('assets/images/ellipse1.png'),
              )),
          const Positioned(
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
                child: const Icon(CupertinoIcons.back)),
          ),
          const Positioned(
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
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    ProfileWidget(
                      imagePath: user.imagePath,
                      onClicked: () {
                        //TODO : EDIT PROFILE PICTURE
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                      alignment: Alignment.topLeft,
                      child: const Text(
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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                ...ListTile.divideTiles(
                                  color: Colors.grey,
                                  tiles: [
                                    ListTile(
                                      leading: const Icon(Icons.person),
                                      title: const Text("Name"),
                                      subtitle: Text(user.name),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.my_location),
                                      title: const Text("Location"),
                                      subtitle: Text(user.location),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.email),
                                      title: const Text("Email"),
                                      subtitle: Text(user.email),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.phone),
                                      title: const Text("Phone"),
                                      subtitle: Text(user.phone),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.person),
                                      title: const Text("About Me"),
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
      ]),
      bottomNavigationBar: BottomNavigationBar(

        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFF56AB91),
        iconSize: 30,

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
        currentIndex: _currentIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
