import 'package:flutter/material.dart';
import 'package:sivic/widgets/activity.dart';
import 'package:sivic/widgets/budget_progress_bar.dart';
import 'package:sivic/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstName = 'Anwarul';
  String address = 'Mohammadpur, Dhaka';
  int notificationCount = 0;
  int complaints = 1214;
  int newComplaints = 12;
  int budgetUsed = 56;
  double disbursedBudget = 0.45;
  int active = 8;
  int underReview = 12;
  int resolved = 76;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage('assets/images/user_icon.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Profile(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Profile()),
                                );
                              },
                              child: Text(
                                'Welcome, $firstName',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF333733),
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Image (image:
                                  AssetImage('assets/icons/location_pin.png'),
                                  height: 14,
                                  width: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '$address',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF848D84),
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    'In your area', style: TextStyle(
                      color: Color(0xFF333733),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                //Complaint Container
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0, left: 18.0, right: 14.0, bottom: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'New Complaints', style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF525D52),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text('$complaints', style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF333733),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          height: 24,
                                          width: 94,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC0F686),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text('+$newComplaints this month', style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF333733),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Image(image: AssetImage('assets/icons/audit.png'), height: 52, width: 52),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image (image: AssetImage('assets/icons/active.png'),
                                            height: 16,
                                            width: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text ('Active', style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF525D52),
                                          ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Text('$active', style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image (image: AssetImage('assets/icons/under_review.png'),
                                            height: 16,
                                            width: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text ('Under review', style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF525D52),
                                          ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Text('$underReview', style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image (image: AssetImage('assets/icons/resolved.png'),
                                            height: 16,
                                            width: 16,
                                          ),
                                          SizedBox(width: 4),

                                          Text ('Resolved', style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF525D52),
                                          ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Text('$resolved', style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                //Budget Container
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0, left: 18.0, right: 14.0, bottom: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Budget used', style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF525D52),
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Text('$budgetUsed%', style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF333733),
                                        ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          height: 24,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC0F686),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text('+$disbursedBudget this week', style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF333733),
                                            ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Image(image: AssetImage('assets/icons/analytics.png'), height: 52, width: 52),
                              ],
                            ),
                            SizedBox(height: 12),

                            BudgetProgressBar(
                              percentage: budgetUsed,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Recent activities', style: TextStyle(
                          color: Color(0xFF333733),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'See all', style: TextStyle(
                        color: Color(0xFF276F27),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Activity(
                  category: 'Infrastructure',
                  title: 'Broken Street',
                  address: 'Uttara C/A Lane, Uttara',
                  progressStatus: 'In progress',
                  imagePath: 'assets/images/issue_image_1.png',
                ),
                SizedBox(height: 8),
                Activity(
                  category: 'Sanitation/Waste',
                  title: 'Broken Water Main',
                  address: 'Road #137, Block B, Gulshan-1',
                  progressStatus: 'Under review',
                  imagePath: 'assets/images/issue_image_2.png',
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
