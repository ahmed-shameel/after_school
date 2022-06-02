import 'dart:convert';
import 'package:after_school/components/custom_nav_bar.dart';
import 'package:after_school/screens/forgot_password/forgot_password_screen.dart';
import 'package:after_school/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import '../../map/map_screen.dart';
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
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = login();
  }

  @override
  Widget build(BuildContext context) {
 //   return FutureBuilder<User>(
 //       future: futureUser,
 //       builder: (context, snapshot) {
//          if (snapshot.hasData) {
//                  User user = snapshot.data!;
            // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(50.0, 175.0, 50.0, 0.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'You are not logged in. \nPlease log in or sign up to access your profile.',
                textAlign: TextAlign.center,
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white
                 ),
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
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
                // CustomDivider(
                //   text: 'OR',
                //   textColor: Colors.white,
                //   dividerColor: Colors.white,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     SocialIcon(
                //       iconSrc: "assets/icons/google_colored.svg",
                //       press: () {
                //         //TODO:GOOGLE API
                //       },
                //     ),
                //     SocialIcon(
                //       iconSrc: "assets/icons/facebook_colored.svg",
                //       press: () {
                //         //TODO: FACEBOOK API
                //       },
                //     ),
                //   ],
                // ),
                CustomDivider(
                  text: 'Don\'t have an account? ',
                  textColor: Colors.white,
                  dividerColor: Colors.white,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      shape: StadiumBorder(),
                      primary: primaryColor,
                    ),

                    onPressed: () {
                  MaterialPageRoute(
                  builder: (context) => SignupScreen());},
                 child: FittedBox(
                   child: Text(
                  'Sign Up ',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ))

                ),
                // children: [
                //       onPressed: () {
                //         Navigator.push(
                //
                //         );
                //       },
                 //     child: c
                  // const Text(
                  //   'or ',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => MapScreen()),
                  //       );
                  //     },
                  //     child: const Text(
                  //       'Continue as a guest',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold, color: Colors.white),
                  //     )),

                ]),
              ],
            ),
    ));

          }
        //   else if (snapshot.hasError) {
        //   return Text('${snapshot.error}');
        //   }
        //   return const CircularProgressIndicator();
        // },

//    );


      Widget loginButton() =>
          CustomButton(
            text: 'Login',
            onClicked: () {
              //TODO:LOGIN, FETCH USER CREDENTIALS ETC.
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (index) => CustomNavBar()));
            },
          );



}
