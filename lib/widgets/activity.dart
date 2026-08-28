import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  final String category;
  final String title;
  final String address;
  final String progressStatus;
  final String imagePath;

  const Activity({
    super.key,
    required this.category,
    required this.title,
    required this.address,
    required this.progressStatus,
    required this.imagePath,
  });

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
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, left: 10, right: 12, bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFDFE6DF), width: 1.25),
                          borderRadius: BorderRadius.circular(24),
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
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
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
                                Expanded(
                                  child: Text(address,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF848D84),
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
