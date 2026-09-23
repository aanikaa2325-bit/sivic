import 'package:flutter/material.dart';
import 'package:sivic/auth_gate.dart';
import 'package:sivic/screens/add_crowdfund.dart';
import 'package:sivic/screens/add_poll.dart';
import 'package:sivic/screens/login_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:sivic/screens/new_post.dart';
import 'package:sivic/screens/signup_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Sivic());
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
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Color(0xFFDFE6DF), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xFFA1CC74), width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xFFF86B59), width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xFFF86B59), width: 1.5),
            ),
          )
      ),
      home: AuthGate(),
    );
  }
}