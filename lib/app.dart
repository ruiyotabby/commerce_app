import 'package:commerce_app/screens/home.dart';
import 'package:commerce_app/screens/login.dart';
import 'package:commerce_app/screens/register.dart';
import 'package:commerce_app/widgets/cards.dart';
import 'package:flutter/material.dart';

class CommerceApp extends StatelessWidget {
  const CommerceApp({Key? key}) : super(key: key);

  static double? global;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commerce',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LogInPage(),
        '/register': (context) => const RegisterPage(),
        ItemCard.routeName: (context) => const ItemCard(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.grey[700]),
          labelLarge: TextStyle(
            fontSize: 17,
          ),
          labelMedium: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
