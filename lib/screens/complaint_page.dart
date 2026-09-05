import 'package:flutter/material.dart';
import 'package:sivic/widgets/complaint_budget.dart';
import 'package:sivic/widgets/complaint_expenditure.dart';
import 'package:sivic/widgets/voting_widget.dart';
import 'package:sivic/widgets/status_widget.dart';

enum CategoryType { general, infrastructure, power, waste }

class AssetData {
  final String title;
  final String location;
  final String imagePath;
  final CategoryType category;

  const AssetData({
    required this.title,
    required this.location,
    required this.imagePath,
    required this.category,
  });
}

class ComplaintPage extends StatelessWidget {

  final AssetData data;

  const ComplaintPage({super.key, required this.data});

  String _getCategoryIconPath(CategoryType category) {
    switch (category) {
      case CategoryType.infrastructure:
        return 'assets/icons/infrastructure.png';
      case CategoryType.power:
        return 'assets/icons/power.png';
      case CategoryType.waste:
        return 'assets/icons/waste.png';
      case CategoryType.general:
      // ignore: unreachable_switch_default
      default:
        return 'assets/icons/general.png';
    }
  }

  String _getCategory(CategoryType category) {
    switch (category) {
      case CategoryType.infrastructure:
        return 'Infrastructure';
      case CategoryType.power:
        return 'Utilities & Power';
      case CategoryType.waste:
        return 'Sanitation / Waste';
      case CategoryType.general:
        return 'General';
      // ignore: unreachable_switch_default
      default:
        return 'Unknown Category';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/icons/back_white.png',
            height: 48,
            width: 48,
          ),
          padding: const EdgeInsets.only(left: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(data.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -32),
              child: Container(
                  decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0, right: 16.0, left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          _getCategoryIconPath(data.category),
                                          width: 14,
                                          height: 14,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          _getCategory(data.category),
                                          style: TextStyle(
                                              color: Color(0xFF333733),
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data.title,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF333733),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Image(image: AssetImage('assets/icons/location_pin.png'), height: 14, width: 14,),
                                          SizedBox(width: 4),
                                          Text(data.location,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF848D84),
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
                          VotingWidget(
                            initialValue: 128,
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Status',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF848D84),
                              ),
                            ),
                            SizedBox(height: 16),
                            StatusWidget(
                              statuses: [
                                Status(
                                    title: "Work Ongoing",
                                    dateTime: "Aug 24, 2026 - 09:00 AM"
                                ),
                                Status(
                                    title: "Budget Allocated",
                                    dateTime: "Aug 24, 2026 - 11:30 AM"
                                ),
                                Status(
                                    title: "Approved",
                                    dateTime: "Aug 25, 2026 - 08:15 AM"
                                ),
                                Status(
                                    title: "Complaint created",
                                    dateTime: "Aug 26, 2026 - 07:45 AM"
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text('Budget Overview',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF848D84),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          ComplaintBudget(allocated: 7556250, expended: 4862310),
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Expenditures',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF848D84),
                                  ),
                                ),
                                SizedBox(height: 4),
                                ComplaintExpenditure(title: 'Labor Cost', dateTime: 'Aug 25, 2026 - 11:30 AM', amount: 12250),
                                ComplaintExpenditure(title: 'Wiring & Circuit Breaker', dateTime: 'Aug 25, 2026 - 10:30 AM', amount: 2100),
                                ComplaintExpenditure(title: 'Replacement LED Luminaire', dateTime: 'Aug 25, 2026 - 10:00 AM', amount: 8500),
                                ComplaintExpenditure(title: 'Bucket Truck Dispatch', dateTime: 'Aug 24, 2026 - 02:00 PM', amount: 5000),
                                ComplaintExpenditure(title: 'Initial Site Inspection', dateTime: 'Aug 24, 2026 - 09:15 AM', amount: 4500),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}