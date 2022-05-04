import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      // width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: -20.0,
              left: -50.0,
              child: Image(
                image: AssetImage('assets/images/ellipse2.png'),
              )),
          Positioned(
              top: -90.0,
              left: 10,
              child: Image(
                image: AssetImage('assets/images/ellipse2.png'),
              )),
          Positioned(
              top: 60,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                height: 150,
                alignment: Alignment.center,
              )),
          child,
        ],
      ),
    );
  }
}
