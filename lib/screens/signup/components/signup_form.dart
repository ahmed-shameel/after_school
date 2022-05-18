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
              child: NameField(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: LastNameField(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: EmailField(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: UsernameField(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: const PasswordField(
                text: 'Password',
              ),
            ),
            PasswordField(
              text: 'Confirm Password',
            ),
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
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePageScreen2()),
            );
          },
      );
}
