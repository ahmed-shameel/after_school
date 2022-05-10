import 'package:after_school/components/email_field.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  ForgotPasswordFormState createState() {
    return ForgotPasswordFormState();
  }
}

class ForgotPasswordFormState extends State<ForgotPasswordForm> {
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
            SizedBox(
              height: 30,
            ),
            EmailField(),
            requestButton(),
          ],
        ),
      ),
    );
  }

  Widget requestButton() => CustomButton(
        text: 'Request password reset',
        onClicked: () {
          //TODO:REQUEST PASSWORD RESET
        },
      );
}
