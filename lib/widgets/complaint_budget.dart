import 'package:flutter/material.dart';

class ComplaintBudget extends StatelessWidget {
  final int allocated;
  final int expended;

  const ComplaintBudget({
    super.key,
    required this.allocated,
    required this.expended,
  });

  int get percentage => ((expended / allocated) * 100).floor();
  int get disbursed => allocated - expended;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: percentage,
              child: Container(
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xFF276F27),
                ),
              ),
            ),
            if (percentage < 100)...[
              const SizedBox(width: 4),
              Expanded(
                flex: 100 - percentage,
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xFFBBDC12),
                  ),
                ),
              ),
            ]
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Allocated',
                    style: TextStyle(
                      color: Color(0xFF525D52),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('৳ $allocated',
                    style: TextStyle(
                      color: Color(0xFF333733),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Color(0xFF276F27),
                          borderRadius: BorderRadius.circular(3.5),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text('Expended',
                        style: TextStyle(
                            color: Color(0xFF525D52),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('৳ $expended',
                    style: TextStyle(
                      color: Color(0xFF333733),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Color(0xFFBBDC12),
                          borderRadius: BorderRadius.circular(3.5),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text('Disbursed',
                        style: TextStyle(
                          color: Color(0xFF525D52),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('৳ $disbursed',
                    style: TextStyle(
                      color: Color(0xFF333733),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}