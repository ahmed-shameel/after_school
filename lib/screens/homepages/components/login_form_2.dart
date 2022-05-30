import 'dart:convert';
import 'package:after_school/screens/forgot_password/forgot_password_screen.dart';
import 'package:after_school/screens/profile/profile_screen.dart';
import 'package:after_school/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/social_icon.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
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
  final FocusNode myFocusNode = FocusNode();
  bool isObscure = true;

  final httpUri = Uri.http('localhost:8080', '/login', {'limit': '10'});

  User user =
      User(username: "", firstName: "", lastName: "", email: "", password: "");

  Future<User> login() async {
    var res = await http.post(httpUri,
        headers: {"Content-Type": "application/json"},
        body: json.encode({'email': user.email, 'password': user.password}));
    if(res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      return User.fromJson(data);
    } else {
      throw Exception("Error");
    }

//    return
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
                'Confirm your email and log in!',
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Don\'t have an account? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()),
                        );
                      },
                      child: const Text(
                        'Sign Up',
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
          User user = login() as User;
          Navigator.push(context,
              MaterialPageRoute(builder: (index) => ProfileScreen(user: user)));
        },
      );
}
