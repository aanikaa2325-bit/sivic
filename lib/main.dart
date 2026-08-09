import 'package:flutter/material.dart';
import 'package:sivic/screens/login_page.dart';
import 'package:sivic/screens/terms_of_use.dart';

void main() {
  runApp(Sivic());
}

class Sivic extends StatelessWidget {
  const Sivic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sivic',
      theme: ThemeData(
        fontFamily: 'InterDisplay',
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Color(0xFFC0F686),
        ),
      ),
      home: const LoginPage(),
    );
  }
}


