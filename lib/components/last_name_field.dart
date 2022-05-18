import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';

class LastNameField extends StatelessWidget {
  final FocusNode myFocusNode = new FocusNode();
  final nameController = TextEditingController();
  LastNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'Last name',
        labelStyle:
        TextStyle(color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        fillColor: primaryColor,
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Invalid name';
        }
        return null;
      },
    );
  }
}