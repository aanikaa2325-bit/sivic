import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sivic/widgets/disbursed.dart';

class Expenditure extends StatelessWidget {
  final String title;
  final int amount;
  final String dateTime;
  final String projectName;
  final int approved;
  final int prevDisbursed;


  const Expenditure({
    super.key,
    required this.title,
    required this.amount,
    required this.dateTime,
    required this.projectName,
    required this.approved,
    required this.prevDisbursed,
  });


  int get newDisbursed => ((amount/approved)*100).floor() + prevDisbursed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333733),
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(projectName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF525D52),
                            ),
                          ),
                          SizedBox(width: 4),
                          Image(image: AssetImage('assets/icons/export.png'), height: 16, width: 16,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Disbursed $newDisbursed%',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF525D52),
                      ),
                    ),
                    SizedBox(height: 2),
                    Disbursed(disbursed: newDisbursed),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dateTime,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF848D84),
                  ),
                ),
                Text('৳ ${NumberFormat('#,##,##0', 'en_IN').format(amount)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333733),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
