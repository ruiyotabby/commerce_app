import 'package:commerce_app/pages/home.dart';
import 'package:commerce_app/pages/login.dart';
import 'package:commerce_app/pages/register.dart';
import 'package:flutter/material.dart';

class CommerceApp extends StatelessWidget {
  const CommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commerce',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LogInPage(),
        '/register':(context) => const RegisterPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
