import 'package:commerce_app/home.dart';
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
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
