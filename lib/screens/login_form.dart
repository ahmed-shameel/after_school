import 'package:after_school/screens/forgot_password_page.dart';
import 'package:after_school/screens/map_page.dart';
import 'package:after_school/screens/profile_page.dart';
import 'package:after_school/screens/signup_page.dart';
import 'package:after_school/widgets/or_divider.dart';
import 'package:after_school/widgets/social_icon.dart';
import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import 'custom_button.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  FocusNode myFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email or username',labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Colors.blue : Colors.black
            ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.black),
              ),
              fillColor: const Color(0xFF94D2BD),
              filled: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Invalid mail or username';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 15.0,
            ),
            child: TextField(
              obscureText: isObscure,
              decoration: InputDecoration(
                fillColor: const Color(0xFF94D2BD),
                filled: true,
                labelText: 'Password',
                labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    }),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0,
                ),
                child: loginButton(),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()),);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 250.0),
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
              const OrDivider(text: 'OR',),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: "assets/icons/google.svg",
                    press: () {
                      //TODO:GOOGLE API
                    },
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {
                      //TODO: FACEBOOK API
                    },
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/sso.svg",
                    press: () {
                      //TODO: SSO API
                    },
                  ),
                ],
              ),
              const OrDivider(text: 'Don\'t have an account? ' ,),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()),);
                    },
                    child: const Text(
                      'Sign Up ',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                    )),
                const Text('or ', style: TextStyle(color: Colors.white),),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },

                    child: const Text(
                      'Continue as a guest. ',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                    )),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginButton() => CustomButton(
        text: 'Login',
        onClicked: () {
          //TODO:LOGIN, FETCH USER CREDENTIALS ETC.
          //some validating code try
          final form = formKey.currentState!;

          if (form.validate()) {
            final email = emailController.text;

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Your email is $email'),
              ));
          }
        },
      );
}
