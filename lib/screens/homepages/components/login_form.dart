import 'package:after_school/components/custom_nav_bar.dart';
import 'package:after_school/components/email_field.dart';
import 'package:after_school/components/password_field.dart';
import 'package:after_school/screens/forgot_password/forgot_password_screen.dart';
import 'package:after_school/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/social_icon.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
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
                      padding: EdgeInsets.only(top: 16.0, left: 150.0),
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
                      child: Text(
                        'Sign Up ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  Text(
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
                      child: Text(
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
        },
      );
}
