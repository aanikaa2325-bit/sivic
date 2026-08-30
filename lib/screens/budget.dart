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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      body: SafeArea(
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
                    Text(
                      'Budget',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E241E),
                      ),
                    ),

                    Stack(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/icons/notification.png',
                          ),
                          height: 30,
                          width: 30,
                        ),

                        Positioned(
                          right: 0,
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
            ],
          ),
        ),
      ),
    );
  }
}