import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CrowdfundProgress extends StatelessWidget {

  final int raised;
  final int goal;


  const CrowdfundProgress({
    Key? key,
    required this.raised,
    required this.goal,
  }) : super(key: key);

  int get percentage => ((raised/goal)*100).floor();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('৳${NumberFormat('#,##,##0', 'en_IN').format(raised)}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333733),
                  ),
                ),
                SizedBox(width: 4),
                Text('raised',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF848D84),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Goal: ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF848D84),
                  ),
                ),
                SizedBox(width: 4),
                Text('৳${NumberFormat('#,##,##0', 'en_IN').format(goal)}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333733),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              flex: percentage,
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Color(0xFFC0F686),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(4.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(4.0),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            if (percentage<100)...[
              Expanded(
                flex: 100 - percentage,
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
