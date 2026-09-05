import 'package:flutter/material.dart';

class Disbursed extends StatelessWidget {
  final int disbursed;

  const Disbursed({
    super.key,
    required this.disbursed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 26,
            width: 1.35,
            decoration: BoxDecoration(
              color: Color(0xFF276F27),
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            flex: disbursed,
            child: Container(
                height: 22,
                decoration: BoxDecoration(
                  color: Color(0xFFBBDC12),
                  borderRadius: BorderRadius.circular(4),
                ),
            ),
          ),
          if (disbursed < 100)...[
            const SizedBox(width: 4),
            Expanded(
                flex: 100 - disbursed,
                child: Container(
                  height: 22,
                  decoration: BoxDecoration(
                    color: Color(0xFFECF4EC),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
            ),
          ],
        ],

      ),
    );
  }
}
