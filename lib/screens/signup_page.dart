import 'package:after_school/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SignUpForm(),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }


}
