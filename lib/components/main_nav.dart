import 'package:after_school/screens/homepages/homepage_screen_2.dart';
import 'package:after_school/screens/map/map_screen.dart';
import 'package:after_school/screens/profile/profile_screen.dart';
import 'package:after_school/screens/pubs_list/pubs_list_screen.dart';
import 'package:flutter/material.dart';
import '../screens/events/events_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 1;
  final screens = [
    HomePageScreen2(),
    MapScreen(),
    EventsScreen(),
    PubsScreen(),
    //ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
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
              icon: Icon(Icons.calendar_month), label: "Events"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pubs',
          ),
        ],
      ),
    );
  }
}
