import 'package:flutter/material.dart';
import '../../../components/background.dart';
import 'login_form_2.dart';

class Body2 extends StatelessWidget {
  const Body2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            LoginForm2(),
          ],
        ),
      ),
    );
  }
}
