import 'package:flutter/material.dart';
import 'package:sivic/widgets/voting_widget.dart';

class PostCard extends StatelessWidget {
  final bool isOnMap;
  final String category;
  final String title;
  final String address;
  final String progressStatus;
  final String? imageData;

  const PostCard({
    super.key,
    required this.isOnMap,
    required this.category,
    required this.title,
    required this.address,
    required this.progressStatus,
    this.imageData,
  });

  bool get hasImage => imageData != null && imageData!.isNotEmpty && !isOnMap;


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
              Column(
                children: [
                  Container(
                    height: 156,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(image: AssetImage(imageData!), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 6),
                ],
              ),
            ],
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFDFE6DF), width: 1.25),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.0),
                              child: Text(category, style: TextStyle(
                                color: Color(0xFF333733),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _getAccentColor(progressStatus),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 10, right: 10, bottom: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: _getStatusColor(progressStatus)
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Text(progressStatus,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF333733),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333733),
                        ),
                      ),
                      Row(
                        children: [
                          Image(image: AssetImage('assets/icons/location_pin.png'), height: 14, width: 14),
                          SizedBox(width: 5),
                          Text(address,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF848D84),
                            ),
                          ),
                        ],
                      )
                    ],

                  ),
                  VotingWidget(initialValue: 245),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


    
    