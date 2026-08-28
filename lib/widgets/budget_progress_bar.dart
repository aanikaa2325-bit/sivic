import 'package:flutter/material.dart';

class BudgetProgressBar extends StatelessWidget {
  final int percentage;

  const BudgetProgressBar({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 48,
          width: 2,
          decoration: BoxDecoration(
            color: Color(0xFF333733),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: percentage,
          child: Container(
            height: 28,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/usedBudgetBar.png'),
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
        ),

        if (percentage < 100)...[
          const SizedBox(width: 5),
          Expanded(
            flex: 100 - percentage,
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                image: DecorationImage(
                  image: AssetImage('assets/images/unusedBudgetBar.png'),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}