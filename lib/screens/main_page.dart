 import 'package:after_school/screens/EventPage.dart';
import 'package:after_school/screens/home_page.dart';
 import 'package:after_school/screens/map_page.dart';
 import 'package:flutter/material.dart';
 import 'package:after_school/screens/list_page.dart';

 class MainPage extends StatefulWidget {
   @override
   State<MainPage> createState() => _MainPageState();
 }

 class _MainPageState extends State<MainPage> {

   int currentIndex = 0;
   final screens = [
     const HomePage(),
     const MapPage(),
     const ListPage(),
     const EventPage(),
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
             icon: Icon(Icons.list),
             label: 'List',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.calendar_month),
             label: "Events"
           )
           ],
       ),
     );
   }
 }
