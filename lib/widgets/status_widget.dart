import 'package:flutter/material.dart';

class Status {
  final String title;
  final String dateTime;

  Status({
    required this.title,
    required this.dateTime,
  });
}

class StatusWidget extends StatelessWidget {
  final List<Status> statuses;

  const StatusWidget({super.key, required this.statuses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(statuses.length, (index) {

        final isLatest = index == 0;

        final isLastInList = index == statuses.length - 1;

        final status = statuses[index];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Image.asset(
                      isLatest
                          ? 'assets/icons/stat_latest.png'
                          : 'assets/icons/stat_before.png',
                      height: 16,
                      width: 16,
                    ),
                  ),

                  if (!isLastInList)
                    Container(
                      width: 1,
                      height: 48,
                      color: const Color(0xFFE7E9E7),
                    ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      status.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isLatest ? Color(0xFF333733) : Color(0xFF646D64),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      status.dateTime,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF848D84),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}