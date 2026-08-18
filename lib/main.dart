import 'package:flutter/material.dart';
import 'package:sivic/navigation_menu.dart';
import 'package:sivic/screens/add_complaint.dart';
import 'package:sivic/screens/home_page.dart';
import 'package:sivic/screens/login_page.dart';
import 'package:sivic/screens/profile.dart';


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

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          hintStyle: TextStyle(
            color: Color(0xFFB8BEB8),
            fontSize: 14,
            fontWeight: FontWeight(400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Color(0xFFDFE6DF), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(0xFFA1CC74), width: 1.5),
          ),
        )
      ),
      home: Profile(),
    );
  }
}


