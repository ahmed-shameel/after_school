import 'dart:convert';

import 'package:after_school/components/email_field.dart';
import 'package:after_school/components/password_field.dart';
import 'package:after_school/screens/forgot_password/forgot_password_screen.dart';
import 'package:after_school/screens/profile/profile_screen.dart';
import 'package:after_school/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_nav_bar.dart';
import '../../../components/social_icon.dart';
import 'package:http/http.dart' as http;

import '../../user/components/user.dart';

class LoginForm2 extends StatefulWidget {
  const LoginForm2({Key? key}) : super(key: key);

  @override
  LoginForm2State createState() {
    return LoginForm2State();
  }
}

class LoginForm2State extends State<LoginForm2> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final httpUri = Uri.http('localhost:8080', '/login', {'limit': '10'});

  User user = User(username: "", firstName: "", lastName: "", email: "", password: "");

  Future login() async{
    var res = await http.post(httpUri,
        headers: {"Content-Type":"application/json"},
        body: json.encode({'email': user.email,'password': user.password}));
    if(res.statusCode == 200){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomNavBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    return
      SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(50.0, 175.0, 50.0, 0.0),

        child: Form(
          key: formKey,
          child: Column(
            children: [


              //  EmailField(),
              TextFormField(
                  controller: TextEditingController(text: user.email),
                  onChanged: (val){
                    user.email = val;
                  },
                  decoration: const InputDecoration(
//                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is Empty';
                    }
                    return '';
                  }),
//          SizedBox(
//            height: 8,
//          ),
//          PasswordField(
//            text: 'Password',
//          ),
              TextFormField(
                obscureText: true,
                controller: TextEditingController(text: user.password),
                onChanged: (val){
                  user.password = val;
                },

                decoration: const InputDecoration(
 //                 border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password is Empty';
                  }
                  return '';
                },)
              ,
              Column(
                children: [
                  loginButton(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  CustomDivider(
                    text: 'OR',
                    textColor: Colors.white,
                    dividerColor: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        iconSrc: "assets/icons/google_colored.svg",
                        press: () {
                          //TODO:GOOGLE API
                        },
                      ),
                      SocialIcon(
                        iconSrc: "assets/icons/facebook_colored.svg",
                        press: () {
                          //TODO: FACEBOOK API
                        },
                      ),
                    ],
                  ),
                  CustomDivider(
                    text: 'Don\'t have an account? ',
                    textColor: Colors.white,
                    dividerColor: Colors.white,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                    const Text(
                      'or ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                        onTap: () {
                          //TODO: GO TO MAP PAGE AS A GUEST
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomNavBar()),
                          );
                        },
                        child: const Text(
                          'Continue as a guest. ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                  ]),
                ],
              ),
            ],
          ),
        ),
      );
  }

  Widget loginButton() => CustomButton(
    text: 'Login',
    onClicked: () {
      //TODO:LOGIN, FETCH USER CREDENTIALS ETC.
      login();
    },
  );
}
