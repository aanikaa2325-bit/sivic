import 'package:flutter/material.dart';

class ClearAllButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ClearAllButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFDDE3DD),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 12),

            const Icon(
              Icons.close,
              size: 18,
              color: Colors.black87,
            ),

            const SizedBox(width: 5),

            const Text(
              'Clear all',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),

            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
