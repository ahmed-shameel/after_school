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
        labelText: 'Name',
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus
                ? Colors.blue
                : Colors.black),
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
        if (value == null || value.isEmpty) {
          return 'Invalid name';
        }
        return null;
      },
    );
  }
}
