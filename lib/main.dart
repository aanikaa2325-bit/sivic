import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sivic',
      theme: ThemeData(
        fontFamily: 'InterDisplay',
      );
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/login_bg.png'),
                fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}


