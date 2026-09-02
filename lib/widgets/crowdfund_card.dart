import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CrowdfundCard extends StatelessWidget {
  final int timeLeft;
  final int raised;
  final int goal;
  final String projectName;
  final int backedBy;
  final String userName;
  final String description;
  final String? imageData;


const CrowdfundCard({
  Key? key,
  required this.timeLeft,
  required this.raised,
  required this.goal,
  required this.projectName,
  required this.backedBy,
  required this.userName,
  required this.description,
  this.imageData,
}) : super(key: key);

  int get percentage => ((raised/goal)*100).floor();
  bool get hasImage => imageData != null && imageData!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 16.0),
        child: Column(
          children: [
            if (hasImage)...[
              Container(
                height: 184,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(imageData!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 6.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(0xFFC0F686),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text('$percentage% reached',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
