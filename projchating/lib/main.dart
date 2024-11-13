import 'package:flutter/material.dart';
import 'package:projchating/LoginPage.dart';
import 'package:projchating/SignupPage.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    routes: {
      "login": (context) => Login(),
      "signup": (context) => SignUp(),
    },
  ));
}
