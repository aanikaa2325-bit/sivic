import 'package:flutter/material.dart';
import 'package:sivic/widgets/post_card.dart';
import 'package:sivic/widgets/poll_card.dart';
import 'package:sivic/widgets/feed_tab.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  int _selectedIndex = 0;
  int _selectedTabIndex = 0;
  final int notificationCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Feed',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E241E),
                        ),
                      ),
                      SizedBox(width: 18),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = 0;
                                  });
                                },
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: _selectedIndex == 0 ? Color(0xFFF5F6F5) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Image(image: AssetImage(
                                        _selectedIndex == 0 ? 'assets/icons/post_view_active.png' : 'assets/icons/post_view_inactive.png'),
                                        height: 24,
                                        width: 24
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = 1;
                                  });
                                },
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: _selectedIndex == 1 ? Color(0xFFF5F6F5) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Image(image: AssetImage(
                                        _selectedIndex == 1 ? 'assets/icons/map_view_active.png' : 'assets/icons/map_view_inactive.png')
                                        , height: 24,
                                        width: 24
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
            ),
            if (_selectedIndex == 0)...[
              SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/map.png'), fit: BoxFit.cover),
                      ),
                    ),

                    Positioned(
                      bottom: 32,
                      left: 20,
                      right: 20,
                      child: PostCard(
                        isOnMap: true,
                        category: 'Sanitation/Waste',
                        title: 'Broken Water Main',
                        address: 'Road#137,Block B, Gulshan 1',
                        progressStatus: 'In Progress',
                        imageData: 'assets/images/issue_image_2.png.png',
                      ),
                    ),
                  ],
                ),
              ),
            ]
            else if (_selectedIndex == 1)...[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTabIndex = 0;
                                    });
                                  },
                                  child: FeedTab(name: 'All', selected: _selectedTabIndex == 0 ? true : false),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTabIndex = 1;
                                    });
                                  },
                                  child: FeedTab(name: 'Complaints', selected: _selectedTabIndex == 1 ? true : false),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTabIndex = 2;
                                    });
                                  },
                                  child: FeedTab(name: 'Polls', selected: _selectedTabIndex == 2 ? true : false),
                                ),
                              ],
                            ),
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Image(image: AssetImage('assets/icons/filter.png'), height: 24, width: 24),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          spacing: 8.0,
                          children: [
                            PostCard(
                              isOnMap: false,
                              category: 'Sanitation/Waste',
                              title: 'Broken Water Main',
                              address: 'Road#137,Block B, Gulshan 1',
                              progressStatus: 'In Progress',
                              imageData: 'assets/images/complaint_image_1.png',
                            ),
                            PollCard(
                                question: 'Do you think that the parking of Rickshaws near Hatirjheel Bridges should be allowed?',
                                options: [
                                  'Yes, I do',
                                  'No, I don’t',
                                  'Not sure'
                                ],
                                percentages: [
                                  58, 22, 20
                                ],
                              pollCreator: 'Farhan Akmal',
                              endTime: DateTime.now().add(const Duration(days: 2, hours: 15)),
                            ),
                            PostCard(
                              isOnMap: false,
                              category: 'Sanitation/Waste',
                              title: 'Broken Water Main',
                              address: 'Road#137,Block B, Gulshan 1',
                              progressStatus: 'In Progress',
                            ),
                            SizedBox(height: 56),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
