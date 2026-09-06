import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sivic/widgets/crowdfund_progress.dart';

class CrowdfundCard extends StatelessWidget {
  final int timeLeft;
  final int raised;
  final int goal;
  final String projectName;
  final int backedBy;
  final String userName;
  final String profilePhoto;
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
    required this.profilePhoto,
    required this.description,
    this.imageData,
  }) : super(key: key);

  int get percentage => ((raised/goal)*100).floor();
  bool get hasImage => imageData != null && imageData!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 16.0),
            child: Column(
              children: [
                if (hasImage)...[
                  Column(
                    children: [
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
                      SizedBox(height: 4),
                    ],
                  ),
                ],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ),
                            Text('$timeLeft days left',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF848D84),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(projectName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF333733),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF848D84),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(profilePhoto),
                                      fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              SizedBox(width: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('by',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF848D84),
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Text(userName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF505C50),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          CrowdfundProgress(raised: raised, goal: goal),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 8),
                                  Text('Backed by $backedBy people',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF333733),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1C1F1C),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text('Back project',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}