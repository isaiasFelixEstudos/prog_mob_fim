import 'package:flutter/material.dart';
import 'package:app_recipes/auxiliar/aux_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text('Login'),
        ),
      ),
      body: TelaDeLogin(),
    );
  }
}
