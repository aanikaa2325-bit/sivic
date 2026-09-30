import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String message;
  final String time;

  const NotificationItem({
    super.key,
    required this.message,
    required this.time,
  }
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: const Color(0xFFD5FFB5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.notifications_none,
            color: Color(0xFF2F7D32),
            size: 26,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  const Text(
                    '•',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(width: 6),

                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}