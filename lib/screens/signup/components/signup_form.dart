import 'dart:convert';

import 'package:after_school/components/email_field.dart';
import 'package:after_school/components/name_field.dart';
import 'package:after_school/components/password_field.dart';
import 'package:after_school/screens/homepages/homepage_screen_2.dart';
import 'package:flutter/material.dart';
import '../../../components/back_to_login.dart';
import '../../../components/custom_button.dart';
import '../../../components/last_name_field.dart';
import '../../../components/username_field.dart';
import "package:http/http.dart" as http;

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

  final httpUri = Uri.http('localhost:8080', 'api/v1/registration', {'limit': '10'});


  Future save(User user) async{
    var res = await http.post(httpUri,
        headers: {"Content-Type":"application/json"},
        body: json.encode({"firstName": user.firstName,"lastName": user.lastName,"username": user.username,"email": user.email,"password": user.password}));
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: firstnameController,
                decoration: InputDecoration(
                  labelText: 'First name',

              ),
            ),
//            Padding(
//              padding: const EdgeInsets.only(bottom: 10),
//              child: LastNameField(),
            ),
              TextField(
                  controller: lastnameController,
                  decoration: InputDecoration(
                    labelText: 'Last name',
              )
              ),
//            Padding(
//              padding: const EdgeInsets.only(bottom: 10),
//              child: EmailField(),
//            ),
            TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                )
            ),

//            Padding(
//              padding: const EdgeInsets.only(bottom: 10),
//              child: UsernameField(),
//            ),
            TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                )
            ),

            TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                )
            ),


//            Padding(
//              padding: const EdgeInsets.only(
//                bottom: 10.0,
//              ),
//              child: const PasswordField(
//                text: 'Password',
//              ),
//            ),
//            PasswordField(
//              text: 'Confirm Password',
//            ),
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
            password: passwordController.text
          );
          save(user);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePageScreen2()
            )
          );
        },
      );
}
