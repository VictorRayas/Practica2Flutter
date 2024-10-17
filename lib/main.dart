import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/screens/reviewCode.dart';
import 'package:flutter_application_1/screens/savePassword.dart';
import 'package:flutter_application_1/screens/sendEmail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  runApp(const MainApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>const Login(),
        '/sendEmail':(context)=>const Sendemail(),
        '/reviewCode':(context)=>const ReviewCode(),
        '/savePassword':(context)=>const Savepassword(),
        '/register':(context)=>const Register(),
        '/profile':(context)=>const Profile(),
      },
    );
  }
}
