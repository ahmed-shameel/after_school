import 'package:after_school/screens/signup/components/signup_form.dart';
import 'package:flutter/material.dart';
import '../../../components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 90),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
