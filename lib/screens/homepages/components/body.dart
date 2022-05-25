import 'package:flutter/material.dart';
import '../../../components/background.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
