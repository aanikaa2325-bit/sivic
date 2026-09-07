import 'package:flutter/material.dart';
import 'package:sivic/screens/feed.dart';

class FeedPostCard extends StatelessWidget {
  final bool isOnMap;
  final String category;
  final String title;
  final String address;
  final String progressStatus;
  final String? imageData;

  const FeedPostCard({
    super.key,
    required this.isOnMap,
    required this.category,
    required this.title,
    required this.address,
    required this.progressStatus,
    this.imageData,
  });

  bool get hasImage => imageData != null && imageData!.isNotEmpty;


  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'in progress':
        return Color(0xFFBBDC12);
      case 'under review':
        return Color(0xFFEDC965);
      case 'postponed':
        return Color(0xFFF58462);
      case 'completed' :
        return Color(0xFF34A853);
      case 'dismissed' :
        return Color(0xFFE33535);
      default:
        return Color(0xFFBCBCBC);
    }
  }

  Color _getAccentColor(String status) {
    switch (status.toLowerCase()) {
      case 'in progress':
        return Color(0xFFF6F7F2);
      case 'under review':
        return Color(0xFFF7F5F2);
      case 'postponed':
        return Color(0xFFF7F3F2);
      case 'completed' :
        return Color(0xFFF6F7F2);
      case 'dismissed' :
        return Color(0xFFF7F2F2);
      default:
        return Color(0xFFF4F4F4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 16),
        child: Column(
          children: [
            if(hasImage)...[
              Container(
                height: 156,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: AssetImage(imageData!), fit: BoxFit.cover),
                ),

              )
            ]
          ],
        ),
      ),
    );
  }
}


    
    