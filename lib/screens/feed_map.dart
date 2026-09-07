import 'package:flutter/material.dart';
import 'package:sivic/widgets/feed_post_card.dart';

class FeedMap extends StatelessWidget {
  const FeedMap({super.key});

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
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Image(image: AssetImage('assets/icons/post_view_inactive.png'), height: 24, width: 24),
                                ),
                              ),
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Image(image: AssetImage('assets/icons/map_view_active.png'), height: 24, width: 24),
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

                  FeedPostCard(
                      isOnMap: true,
                      category: 'Sanitation/Waste',
                      title: 'Broken Water Main',
                      address: 'Road#137,Block B, Gulshan 1',
                      progressStatus: 'In Progress',
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
