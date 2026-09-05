import 'package:flutter/material.dart';
import 'package:sivic/screens/budget.dart';
import 'package:sivic/screens/complaint_page.dart';

void main() {
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
      home: ComplaintPage(
        data: AssetData(
          title: 'Broken Streetlight',
          location: '123 Main Street, Springfield',
          imagePath: 'assets/images/complaint_image_1.png',
          category: CategoryType.power,
        ),
      ),
    );
  }
}


