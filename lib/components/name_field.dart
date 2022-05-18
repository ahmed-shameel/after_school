import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final FocusNode myFocusNode = new FocusNode();
  final nameController = TextEditingController();
  NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'First name',
        labelStyle:
            TextStyle(color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        fillColor: primaryColor,
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Invalid name';
        }
        return nameController.text;
      },
    );
  }
}
