import 'package:after_school/screens/hompage.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetState();
}

class _ResetState extends State<ResetPasswordPage> {
  FocusNode myFocusNode = new FocusNode();
  final passwordController = TextEditingController();
  bool isPasswordObscure = true;
  bool isConfirmObscure = true;

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
                          'Reset Password',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Text('Please enter your new password.'),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          bottom: 10.0,
                        ),
                        child: TextField(
                          obscureText: isPasswordObscure,
                          decoration: InputDecoration(
                            fillColor: Color(0xFF94D2BD),
                            filled: true,
                            labelText: 'New password',
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.black),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordObscure ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordObscure = !isPasswordObscure;
                                  });
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15.0,
                        ),
                        child: TextField(
                          obscureText: isConfirmObscure,
                          decoration: InputDecoration(
                            fillColor: Color(0xFF94D2BD),
                            filled: true,
                            labelText: 'Confirm new password',
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.black),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  isConfirmObscure ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isConfirmObscure = !isConfirmObscure;
                                  });
                                }),
                          ),
                        ),
                      ),
                      resetPasswordButton(),
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

  Widget resetPasswordButton() => CustomButton(
    text: 'Reset password',
    onClicked: () {
      //TODO:REQUEST PASSWORD RESET
    },
  );
}
