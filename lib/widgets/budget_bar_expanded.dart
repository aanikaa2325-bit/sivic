import 'package:flutter/material.dart';

class BudgetBarExpanded extends StatelessWidget {
  final int approved;
  final int disbursed;
  final int total;

  const BudgetBarExpanded({
    Key? key,
    required this.approved,
    required this.disbursed,
    required this.total,
  }) : super(key: key);

  int get percentage => ((approved / total) * 100).floor();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: percentage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(6),
                  ),
                  color: Color(0xFF276F27),
                ),
              ),
              FractionallySizedBox(
                widthFactor: disbursed/approved,
                child: Container(
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                    color: Color(0xFFBBDC12),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (percentage < 100)...[
          const SizedBox(width: 4),
          Expanded(
            flex: 100 - percentage,
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFFECF4EC),
              ),
            ),
          ),
        ]
      ],
    );
  }
}