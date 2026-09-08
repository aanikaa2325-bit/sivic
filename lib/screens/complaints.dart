import 'package:flutter/material.dart';
import 'package:sivic/screens/add_complaint.dart';
import 'package:sivic/widgets/feed_tab.dart';
import 'package:sivic/widgets/activity.dart';
import 'package:sivic/screens/complaint_page.dart';




class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  int notificationCount = 3;
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Complaints',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E241E),
                      ),
                    ),
                    Stack(
                      children: [
                        Image(image:
                        AssetImage('assets/icons/notification.png'),
                          height: 30,
                          width: 30,
                        ),

                        Positioned(
                          right:  0,
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
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 0;
                          });
                        },
                        child: FeedTab(name: 'Active', selected: _selectedTabIndex == 0 ? true : false),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 1;
                          });
                        },
                        child: FeedTab(name: 'Under review', selected: _selectedTabIndex == 1 ? true : false),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 2;
                          });
                        },
                        child: FeedTab(name: 'Resolved', selected: _selectedTabIndex == 2 ? true : false),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 3;
                          });
                        },
                        child: FeedTab(name: 'Completed', selected: _selectedTabIndex == 3 ? true : false),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  spacing: 8.0,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ComplaintPage(
                            data: AssetData(
                              title: "Broken Street Lamp",
                              location: "Road #137, Block B, Gulshan-1",
                              imagePath: "assets/images/complaint_image_1.png",
                              category: CategoryType.infrastructure,
                            ),
                          ),
                          ),
                        );
                      },
                      child: Activity(
                        category: 'Infrastructure',
                        title: 'Broken Street Lamp',
                        address: 'Road #137, Block B, Gulshan-1',
                        progressStatus: 'In progress',
                        imagePath: 'assets/images/complaint_image_1.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ComplaintPage(
                            data: AssetData(
                              title: "Broken Water Main",
                              location: "Uttara C/A Lane, Uttara 1231",
                              imagePath: "assets/images/issue_image_2.png",
                              category: CategoryType.waste,
                            ),
                          ),
                          ),
                        );
                      },
                      child: Activity(
                        category: 'Sanitation/Waste',
                        title: 'Broken Water Main',
                        address: 'Uttara C/A Lane, Uttara 1231',
                        progressStatus: 'Under review',
                        imagePath: 'assets/images/issue_image_2.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddComplaint(),
            ),
          );
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xFF1C1F1C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 20.0),
            child: Row(
              spacing: 8.0,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(image: AssetImage('assets/icons/add_white.png'), height: 20, width: 20),
                Text('New Complaint',
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
      ),
    );
  }
}
