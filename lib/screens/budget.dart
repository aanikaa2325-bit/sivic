import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sivic/widgets/budget_bar_expanded.dart';
import 'package:sivic/widgets/expenditure.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  int notificationCount = 3;
  int allocated = 7556250;
  int approved = 3022500;
  int disbursed = 2115750;
  int get remaining => allocated - approved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Budget',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E241E),
                        ),
                      ),
                      Stack(
                        children: [
                          Image(image:
                          AssetImage('assets/icons/notification.png'),
                            height: 30,
                            width: 30,
                          ),
          
                          Positioned(
                            right:  0,
                            top: 0,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xFFC0F686),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '$notificationCount',
                                  style: TextStyle(
                                    color: Color(0xFF333733),
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
          
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 14.0, right: 14.0, bottom: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total municipal allocation',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xFF525D52),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text('৳ ${NumberFormat('#,##,##0', 'en_IN').format(allocated)}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF333733),
                                )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: BudgetBarExpanded(approved: approved, disbursed: disbursed, total: allocated),
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Color(0xFF276F27),
                                        ),
                                      ),
                                      SizedBox(width: 4.5),
                                      Text('Approved',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF525D52),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Text('৳ ${NumberFormat('#,##,##0', 'en_IN').format(approved)}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF333733),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Color(0xFFBBDC12),
                                        ),
                                      ),
                                      SizedBox(width: 4.5),
                                      Text('Disbursed',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF525D52),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Text('৳ ${NumberFormat('#,##,##0', 'en_IN').format(disbursed)}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF333733),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Color(0xFFECF4EC),
                                        ),
                                      ),
                                      SizedBox(width: 4.5),
                                      Text('Remaining',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF525D52),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Text('৳ ${NumberFormat('#,##,##0', 'en_IN').format(remaining)}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF333733),
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Approved Expenditures',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333733),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Thu, Apr 23',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF848D84),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Expenditure(
                    title: 'Laborer Cost',
                    amount: 12250,
                    dateTime: '2026-04-23 18:07',
                    projectName: 'Broken Water Supply',
                    approved: 306250,
                    prevDisbursed: 58,
                ),
                SizedBox(height: 4),
                Expenditure(
                    title: 'Material Cost',
                    amount: 23250,
                    dateTime: '2026-04-23  22:49',
                    projectName: 'Broken Street Lamp',
                    approved: 306250,
                    prevDisbursed: 32,
                ),
                SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Mon, Mar 16',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF848D84),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Expenditure(
                  title: 'Bulb & Electrician Charge',
                  amount: 12250,
                  dateTime: '2026-04-23 18:07',
                  projectName: 'Broken Water Supply',
                  approved: 306250,
                  prevDisbursed: 58,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
