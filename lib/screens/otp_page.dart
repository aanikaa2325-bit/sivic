import 'package:flutter/material.dart';
import 'package:sivic/navigation_menu.dart';
import 'package:sivic/screens/create_new_pass.dart';
import 'package:sivic/screens/privacy_policy.dart';
import 'package:sivic/screens/terms_of_use.dart';
import 'package:sivic/widgets/otp.dart';

class OtpPage extends StatefulWidget {
  final bool isFromForgotPassword;

  const OtpPage({
    Key? key,
    this.isFromForgotPassword = false,
  }) : super(key: key);
  
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
                    Text('Verify Email',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Color(0xFF1E241E),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('We sent an OTP to an*****64@gmail.com. Enter the OTP to verify your account',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14 ,
                        color: Color(0xFF848D84),
                      ),
                    ),
                    SizedBox(height: 20),
                    Otp(),
                    SizedBox(height: 28),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          widget.isFromForgotPassword
                              ? MaterialPageRoute(builder: (context) => const CreateNewPass())
                              : MaterialPageRoute(builder: (context) => const NavigationMenu()),
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
                            child: Text('Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
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
