import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projchating/Forgot.dart';
import 'package:projchating/LoginPage.dart';
import 'package:projchating/MainPage.dart';
import 'package:projchating/SignupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projchating/providerr/provide.dart';
import 'package:projchating/userlist.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  final mybox=await Hive.openBox("mybox");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(create: (context) => Pro(),
   child:  MaterialApp(
    home: MainPage(),
    routes: {
      "login": (context) => Login(),
      "signup": (context) => SignUp(),
      "forgot": (context) => ForgotPage(),
      "users":(context)=>Users()
    },
  )
  )
  );
}
