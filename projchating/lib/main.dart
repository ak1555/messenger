import 'package:flutter/material.dart';
import 'package:projchating/LoginPage.dart';
import 'package:projchating/MainPage.dart';
import 'package:projchating/SignupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(MaterialApp(
    home: MainPage(),
    routes: {
      "login": (context) => Login(),
      "signup": (context) => SignUp(),
    },
  ));
}
