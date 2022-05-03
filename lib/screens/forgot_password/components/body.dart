import 'package:after_school/components/back_to_login.dart';
import 'package:flutter/material.dart';
import '../../../components/background.dart';
import 'forgot_password_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text('Please enter the email you used to sign in.',),
            ForgotPasswordForm(),
            BackToLogin()
          ],
        ),
      ),
    );
  }
}
