import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  int selectedIndex = 0;

  Widget complaintContainer(
      int index,
      String iconPath,
      String text,
      ) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFFC0F686)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Color(0xFFBDE394)
                : Color(0xFFDFE6DF),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14, top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                iconPath,
                width: 20,
                height: 20,
              ),

              const SizedBox(width: 8),

              Text(
                text,
                style: TextStyle(
                  color: Color(0xFF333733),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: complaintContainer(0, 'assets/icons/general.png', 'General',)),
                SizedBox(width: 4),
                Expanded(child: complaintContainer(1, 'assets/icons/infrastructure.png', 'Infrastructure',)),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Expanded(child: complaintContainer(2, 'assets/icons/power.png', 'Utilities & Power',)),
                SizedBox(width: 4),
                Expanded(child: complaintContainer(3, 'assets/icons/waste.png', 'Sanitation/Waste',)),
              ],
            ),
          ],
    );
  }
}