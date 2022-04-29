import 'package:flutter/material.dart';
import 'package:after_school/screens/hompage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AfterSchool',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}