import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/reviewCode.dart';
import 'package:flutter_application_1/screens/savePassword.dart';
import 'package:flutter_application_1/screens/sendEmail.dart';


void main() {
  runApp(const MainApp());
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
      },
    );
  }
}
