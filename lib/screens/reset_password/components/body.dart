import 'package:after_school/screens/reset_password/components/reset_password_form.dart';
import 'package:flutter/material.dart';
import '../../../components/background.dart';
import '../../homepages/homepage_screen.dart';

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
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Back to login ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
