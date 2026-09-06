import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sivic/widgets/budget_bar_expanded.dart';
import 'package:sivic/widgets/crowdfund_card.dart';
import 'package:sivic/widgets/expenditure.dart';

class Crowdfund extends StatefulWidget {
  const Crowdfund({super.key});

  @override
  State<Crowdfund> createState() => _CrowdfundState();
}

class _CrowdfundState extends State<Crowdfund> {
  int notificationCount = 3;
  String sort_by = 'Newest';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        'Crowdfund',
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 10.0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image(image: AssetImage('assets/icons/sort.png'), height: 16, width: 16),
                                SizedBox(width: 6),
                                Text(sort_by,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF303230),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Image(image: AssetImage('assets/icons/arrow_down.png'), height: 20, width: 20),
          
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C1F1C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 18.0),
                        child: Row(
                          children: [
                            Image(image: AssetImage('assets/icons/add_white.png'), height: 16, width: 16),
                            SizedBox(width: 6),
                            Text('New initiative',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CrowdfundCard(
                  timeLeft: 12,
                  raised: 9875,
                  goal: 13715,
                  projectName: 'Hatirjheel Park Roadside Trash',
                  backedBy: 45,
                  userName: 'Farhan Akmal',
                  profilePhoto: 'assets/images/user_icon.png',
                  description: 'Raising fund for placing trash cans nearside Hatirjheel Lake area.',
                  imageData: 'assets/images/complaint_image_1.png',
                ),
                CrowdfundCard(
                  timeLeft: 12,
                  raised: 9875,
                  goal: 13715,
                  projectName: 'Hatirjheel Park Roadside Trash',
                  backedBy: 45,
                  userName: 'Farhan Akmal',
                  profilePhoto: 'assets/images/user_icon.png',
                  description: 'Raising fund for placing trash cans nearside Hatirjheel Lake area.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}