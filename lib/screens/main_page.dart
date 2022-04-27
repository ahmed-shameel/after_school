import 'package:after_school/screens/home_page.dart';
import 'package:after_school/screens/map_page.dart';
import 'package:flutter/material.dart';
import 'package:after_school/screens/list_page.dart';

class main_page extends StatefulWidget {
  @override
  State<main_page> createState() => _MainPageState();
}

class _MainPageState extends State<main_page> {

  int currentIndex = 0;
  final screens = [
    home_page(),
    map_page(),
    list_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
            label: 'Events',
          ),
        ],
      ),
    );
  }
}
