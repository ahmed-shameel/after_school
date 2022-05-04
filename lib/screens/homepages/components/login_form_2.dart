import 'package:after_school/components/email_field.dart';
import 'package:after_school/components/password_field.dart';
import 'package:after_school/screens/forgot_password/forgot_password_screen.dart';
import 'package:after_school/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/social_icon.dart';

class LoginForm2 extends StatefulWidget {
  const LoginForm2({Key? key}) : super(key: key);

  @override
  LoginForm2State createState() {
    return LoginForm2State();
  }
}

class LoginForm2State extends State<LoginForm2> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(50.0, 150.0, 50.0, 0.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            EmailField(),
            SizedBox(
              height: 8,
            ),
            PasswordField(
              text: 'Password',
            ),
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
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, left: 250.0),
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder:
                                  (context) => SignupScreen()),
                        );
                      },
                      child: Text(
                        'Sign Up ',
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
    },
  );
}
