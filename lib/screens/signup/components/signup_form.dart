import 'package:after_school/components/email_field.dart';
import 'package:after_school/components/name_field.dart';
import 'package:after_school/components/password_field.dart';
import 'package:after_school/screens/homepages/homepage_screen_2.dart';
import 'package:flutter/material.dart';
import '../../../components/back_to_login.dart';
import '../../../components/custom_button.dart';
import '../../../components/last_name_field.dart';
import '../../../components/username_field.dart';

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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
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
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the that user has entered by using the
            // TextEditingController.
            content: Text(firstnameController.text+lastnameController.text+emailController.text+usernameController.text+passwordController.text),
          );
        },
      );
    },
      );
}
