import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const LoginButton({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(50),
      shape: StadiumBorder(),
      primary: Colors.black,
    ),
    child: FittedBox(
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
    onPressed: onClicked,
  );
}