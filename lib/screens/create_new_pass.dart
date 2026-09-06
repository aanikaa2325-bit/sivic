import 'package:flutter/material.dart';
import 'package:sivic/navigation_menu.dart';
import 'package:sivic/screens/signup_page.dart';
import 'package:sivic/screens/privacy_policy.dart';
import 'package:sivic/screens/terms_of_use.dart';

class CreateNewPass extends StatefulWidget {
  const CreateNewPass({super.key});

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {

  bool _isPasswordHidden = true;
  bool _showEmptyError = false;
  bool _showMismatchError = false;
  bool _showLengthError = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                  Text('Create New Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: Color(0xFF1E241E),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Create a new password for your account',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14 ,
                      color: Color(0xFF848D84),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    cursorColor: Color(0xFF4A8B4A),
                    obscureText: _isPasswordHidden,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: (_showEmptyError || _showMismatchError || _showLengthError) ? Color(0xFFF86B59) : Color(0xFFDFE6DF), width: 1.5),
                      ),
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
                      hintText: 'New password',
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _confirmPasswordController,
                    cursorColor: Color(0xFF4A8B4A),
                    obscureText: _isPasswordHidden,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: (_showEmptyError || _showMismatchError || _showLengthError) ? Color(0xFFF86B59) : Color(0xFFDFE6DF), width: 1.5),
                      ),
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
                      hintText: 'Confirm password',
                    ),
                  ),
                  if (_showEmptyError)...[
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text('Password field(s) cannot be empty.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF86B59),
                        ),
                      ),
                    ),
                  ]
                  else if (_showMismatchError)...[
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text('Passwords do not match',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF86B59),
                        ),
                      ),
                    ),
                  ]
                  else if (_showLengthError)...[
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text('Password must be at least 8 digits.',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF86B59),
                          ),
                        ),
                      ),
                    ],
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        final pass = _passwordController.text;
                        final confirmPass = _confirmPasswordController.text;

                        _showEmptyError = false;
                        _showMismatchError = false;

                        if (pass.isEmpty || confirmPass.isEmpty) {
                          _showEmptyError = true;
                        } else if (pass != confirmPass) {
                          _showMismatchError = true;
                        } else if (pass.length<8 || confirmPass.length<8){
                          _showLengthError = true;
                        }
                        else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const NavigationMenu()),
                                (Route<dynamic> route) => false,
                          );
                        }
                      });
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
                          child: Text('Continue to your account',
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
