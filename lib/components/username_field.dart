import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final FocusNode myFocusNode = new FocusNode();
  final emailController = TextEditingController();
  UsernameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle:
        TextStyle(color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        fillColor: Color(0xFFB2E2D3),
        filled: true,
      ),
      validator: (value) {
        //TODO:VALIDATE EMAIL/USERNAME
      },
    );
  }
}
