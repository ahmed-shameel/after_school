import 'package:flutter/material.dart';
import 'package:after_school/widgets/login_form.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF56AB91),
      body: SingleChildScrollView(
        child: Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 90.0),
                    child: Container(
                        alignment: Alignment.center,
                        height: 150,
                        child:
                            Image(image: AssetImage('assets/images/logo.png'))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        LoginForm(),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),

      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.map),
      //       label: 'Map',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       label: 'Events',
      //     ),
      //   ],
      // ),
    );
  }
}
