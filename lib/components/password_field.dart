import 'package:after_school/contants.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String text;
  const PasswordField({Key? key, required this.text,}) : super(key: key);

  @override
  PasswordFieldState createState() {
    return PasswordFieldState();
  }
}

class PasswordFieldState extends State<PasswordField> {
  final FocusNode myFocusNode = new FocusNode();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        fillColor: primaryColor,
        filled: true,
        labelText: widget.text,
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
              isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            }),
      ),
    );
  }
}
