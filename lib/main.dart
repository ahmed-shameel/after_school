import 'package:after_school/screens/homepages/homepage_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AfterSchool',
      theme: ThemeData(),
      home: HomePageScreen(),
    );
  }
}
