import 'package:flutter/material.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Invalid mail';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 15.0,
            ),
            child: TextField(
              obscureText: isObscure,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    }),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: loginButton(),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Don\'t have an account? '),
                GestureDetector(
                    onTap: () {
                      //TODO: registration page
                    },

                    child: Text(
                      'Sign Up. ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                GestureDetector(
                    onTap: () {
                      //TODO: forgot your password page
                    },
                    child: Text('Forgot your password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),)),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginButton() => LoginButton(
        text: 'LOGIN',
        onClicked: () {
          final form = formKey.currentState!;

          if (form.validate()) {
            final email = emailController.text;

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Your email is $email'),
              ));
          }
        },
      );
}
