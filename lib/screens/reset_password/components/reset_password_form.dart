import 'package:after_school/components/password_field.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../components/password_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  ResetPasswordFormState createState() {
    return ResetPasswordFormState();
  }
}

class ResetPasswordFormState extends State<ResetPasswordForm> {
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
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 10.0,
              ),
              child: PasswordField(
                text: 'New Password',
              ),
            ),
            PasswordField(
              text: 'Confirm new password',
            ),
            resetPasswordButton(),
          ],
        ),
      ),
    );
  }

  Widget resetPasswordButton() => CustomButton(
        text: 'Request password reset',
        onClicked: () {
          //TODO:REQUEST PASSWORD RESET
        },
      );
}
