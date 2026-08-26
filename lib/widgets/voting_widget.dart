import 'package:flutter/material.dart';

class VotingWidget extends StatefulWidget {
  final int initialValue;

  const VotingWidget({
    super.key,
    this.initialValue = 0,
  });

  @override
  State<VotingWidget> createState() => _VotingWidgetState();
}

class _VotingWidgetState extends State<VotingWidget> {
  late int voteCount;

  int? selectedVote;

  @override
  void initState() {
    super.initState();
    voteCount = widget.initialValue;
  }

  void handleUpvote() {
    setState(() {
      if (selectedVote == 1) {
        voteCount--;
        selectedVote = null;
      } else if (selectedVote == -1) {
        voteCount += 2;
        selectedVote = 1;
      } else {
        voteCount++;
        selectedVote = 1;
      }
    });
  }

  void handleDownvote() {
    setState(() {
      if (selectedVote == -1) {
        voteCount++;
        selectedVote = null;
      } else if (selectedVote == 1) {
        voteCount -= 2;
        selectedVote = -1;
      } else {
        voteCount--;
        selectedVote = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: handleUpvote,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedVote == 1
                  ? const Color(0xFFC0F686)
                  : const Color(0xFFF5F6F5),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/upvote.png',
                width: 18,
                height: 18,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        Text(
          '$voteCount',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF343735),
          ),
        ),

        const SizedBox(height: 8),

        GestureDetector(
          onTap: handleDownvote,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedVote == -1
                  ? const Color(0xFFC0F686)
                  : const Color(0xFFF5F6F5),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/downvote.png',
                width: 18,
                height: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}