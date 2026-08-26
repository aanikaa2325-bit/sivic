import 'package:flutter/material.dart';


class ComplaintExpenditure extends StatelessWidget {

  final String title;
  final String dateTime;
  final int amount;

  const ComplaintExpenditure({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text (title,
                  style: TextStyle(
                      color: Color(0xFF333733),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6),
                Text (dateTime,
                  style: TextStyle(
                    color: Color(0xFF848D84),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('৳ ', style: TextStyle(color: Color(0xFF848D84), fontSize: 14, fontWeight: FontWeight.w500),),
                SizedBox(width: 3),
                Text('$amount', style: TextStyle(color: Color(0xFF333733), fontSize: 14, fontWeight: FontWeight.w500),),
              ],
            ),
          ],
        ),
        SizedBox(height: 14),
      ],
    );
  }
}
