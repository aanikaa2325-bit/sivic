import 'package:flutter/material.dart';

class FeedTab extends StatelessWidget {
  final String name;
  final bool selected;

  const FeedTab({super.key,
    required this.name,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: selected ? Color(0xFFC0F686) : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF303230),),
                  ),
          ),
        ),
      ),
    );
  }
}
