import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../constants.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  ResetPasswordFormState createState() {
    return ResetPasswordFormState();
  }
}

class ResetPasswordFormState extends State<ResetPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  final FocusNode myFocusNode = new FocusNode();
  bool isObscure1 = true;
  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    // User user = User(username: "", firstName: "", lastName: "", email: "", password: "");
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
              child: TextFormField(
                // controller: TextEditingController(text: user.password),
                // onChanged: (val) {
                //   user.password = val;
                // },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is empty';
                  }
                  return '';
                },
                obscureText: isObscure1,
                decoration: InputDecoration(
                  fillColor: fieldFillColor,
                  filled: true,
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(
                        isObscure1 ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure1 = !isObscure1;
                        });
                      }),
                ),
              ),
            ),
            TextFormField(
              // controller: TextEditingController(text: user.password),
              // onChanged: (val) {
              //   user.password = val;
              // },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is empty';
                }
                return '';
              },
              obscureText: isObscure2,
              decoration: InputDecoration(
                fillColor: fieldFillColor,
                filled: true,
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                    color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      isObscure2 ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure2 = !isObscure2;
                      });
                    }),
              ),
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
