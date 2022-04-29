import 'package:after_school/screens/hompage.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotState();
}

class _ForgotState extends State<ForgotPasswordPage> {
  FocusNode myFocusNode = new FocusNode();
  final emailController = TextEditingController();

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
                          'Forgot your password?',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Text('Please enter the email you used to sign in.'),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.blue
                                    : Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            fillColor: Color(0xFF94D2BD),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid mail';
                            }
                            return null;
                          },
                        ),
                      ),
                      requestButton(),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Back to login ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
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

  Widget requestButton() => CustomButton(
        text: 'Request password reset',
        onClicked: () {
          //TODO:REQUEST PASSWORD RESET
        },
      );
}
