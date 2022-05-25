import 'dart:convert';
import 'package:after_school/screens/homepages/homepage_screen_2.dart';
import 'package:flutter/material.dart';
import '../../../components/back_to_login.dart';
import '../../../components/custom_button.dart';
import "package:http/http.dart" as http;
import '../../../constants.dart';
import '../../user/components/user.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  late String firstname;
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode myFocusNode = new FocusNode();
  bool isObscure = true;

  final httpUri =
      Uri.http('localhost:8080', 'api/v1/registration', {'limit': '10'});

  Future save(User user) async {
    var res = await http.post(httpUri,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "firstName": user.firstName,
          "lastName": user.lastName,
          "username": user.username,
          "email": user.email,
          "password": user.password
        }));
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: firstnameController,
                decoration: InputDecoration(
                  labelText: 'Firstname',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  fillColor: fieldFillColor,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: lastnameController,
                decoration: InputDecoration(
                  labelText: 'Lastname',
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: emailController,
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
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
              ),
            ),
            TextField(
              controller: passwordController,
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
            signupButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                BackToLogin(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget signupButton() => CustomButton(
        text: 'Create account',
        onClicked: () {
          User user = User(
              username: usernameController.text,
              firstName: firstnameController.text,
              lastName: lastnameController.text,
              email: emailController.text,
              password: passwordController.text);
          save(user);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePageScreen2()));
        },
      );
}
