import 'dart:convert';
import 'package:after_school/screens/forgot_password/forgot_password_screen.dart';
import 'package:after_school/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_nav_bar.dart';
import '../../../components/custom_nav_bar_guest.dart';
import '../../../components/social_icon.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import '../../map/map_screen.dart';
import '../../user/components/user.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode myFocusNode = FocusNode();
  bool isObscure = true;

  final httpUri = Uri.http('localhost:8080', '/login', {'limit': '10'});

  User user =
      User(username: "", firstName: "", lastName: "", email: "", password: "");

  Future login() async {
    var res = await http.post(httpUri,
        headers: {"Content-Type": "application/json"},
        body: json.encode({'email': user.email, 'password': user.password}));
    //TODO if logged in successfully navigate to map otherwise show error
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(50.0, 175.0, 50.0, 0.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Welcome to After School, please login!',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

            //  EmailField(),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  fillColor: fieldFillColor,
                  filled: true,
                ),
                controller: TextEditingController(text: user.email),
                onChanged: (val) {
                  user.email = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is Empty';
                  }
                  return '';
                }),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: TextEditingController(text: user.password),
              onChanged: (val) {
                user.password = val;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'password is Empty';
                }
                return '';
              },
              obscureText: isObscure,
              decoration: InputDecoration(
                fillColor: fieldFillColor,
                filled: true,
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomNavBarGuest()),
                        );
                      },
                      child: const Text(
                        'Continue as a guest',
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
          //         User user = login() as User;
               Navigator.push(context,
                  MaterialPageRoute(
                      builder: (index) => CustomNavBar()));
        },
      );
}
