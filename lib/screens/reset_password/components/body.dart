import 'package:after_school/components/back_to_login.dart';
import 'package:after_school/screens/reset_password/components/reset_password_form.dart';
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
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Reset Password',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text('Please enter your new password.'),
            ResetPasswordForm(),
            BackToLogin(),
          ],
        ),
      ),
    );
  }
}
