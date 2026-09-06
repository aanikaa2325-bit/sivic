import 'package:flutter/material.dart';
import 'package:sivic/navigation_menu.dart';
import 'package:sivic/screens/home_page.dart';
import 'package:sivic/screens/otp_page.dart';
import 'package:sivic/screens/signup_page.dart';
import 'package:sivic/screens/privacy_policy.dart';
import 'package:sivic/screens/terms_of_use.dart';

class EnterPassword extends StatefulWidget {
  const EnterPassword({super.key});

  @override
  State<EnterPassword> createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {

  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 88,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/icons/back.png',
            height: 48,
            width: 48,
          ),
          padding: const EdgeInsets.only(left: 16),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 48),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 72,
                  ),
                  SizedBox(height: 28),
                  Text('Enter your password',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: Color(0xFF1E241E),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('anwarulazim@gmail.com.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14 ,
                      color: Color(0xFF848D84),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(

                    cursorColor: Color(0xFF4A8B4A),
                    obscureText: _isPasswordHidden,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: IconButton(
                          icon: Image.asset(
                            _isPasswordHidden
                                ? 'assets/icons/hide.png'
                                : 'assets/icons/unhide.png',
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                        ),
                      ),
                      hintText: 'Create a password',
                    ),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpPage(isFromForgotPassword: true),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF276F27),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationMenu(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 56,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFF1C1F1C),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Text('Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(color: Color(0xFF848D84), fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignupPage()),
                          );
                        },
                        child: Text(
                          'Register now',
                          style: TextStyle(color: Color(0xFF333733), fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By continuing, you agree with the ',
                        style: TextStyle(
                          color: Color(0xFF848D84),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TermsOfUse()),
                          );
                        },
                        child: Text(
                          'Terms of Use',
                          style: TextStyle(
                            color: Color(0xFF1C1F1C),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'and ',
                        style: TextStyle(
                          color: Color(0xFF848D84),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
                          );
                        },
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF1C1F1C),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
