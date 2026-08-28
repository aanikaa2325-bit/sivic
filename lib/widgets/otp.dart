import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 76,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              cursorColor: Color(0xFF4A8B4A),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight(500),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 76,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              cursorColor: Color(0xFF4A8B4A),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight(500),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 76,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              cursorColor: Color(0xFF4A8B4A),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight(500),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 76,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              cursorColor: Color(0xFF4A8B4A),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight(500),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
