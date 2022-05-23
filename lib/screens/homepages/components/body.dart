import 'package:flutter/material.dart';
import '../../../components/background.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
