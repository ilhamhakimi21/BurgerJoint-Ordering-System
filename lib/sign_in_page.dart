import './authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burger Joint"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: emailController,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
            child: Text("Sign in"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
            child: Text("Sign up"),
          )
        ],
      ),
    );
  }
}
