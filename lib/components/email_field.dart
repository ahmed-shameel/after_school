import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final FocusNode myFocusNode = new FocusNode();
  final emailController = TextEditingController();
  EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email or username',
        labelStyle:
            TextStyle(color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        fillColor: Color(0xFF94D2BD),
        filled: true,
      ),
      validator: (value) {
        //TODO:VALIDATE EMAIL/USERNAME
      },
    );
  }
}
