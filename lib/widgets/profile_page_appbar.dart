import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
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
      IconButton(
        icon: Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}
