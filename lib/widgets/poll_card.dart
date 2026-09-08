import 'package:flutter/material.dart';

class PollCard extends StatefulWidget {
  final String question;
  final List<String> options;
  final List<int> percentages;
  final String pollCreator;
  final DateTime endTime;


  PollCard({
    super.key,
    required this.question,
    required this.options,
    required this.percentages,
    required this.pollCreator,
    required this.endTime,
  }) :
    assert(
      options.length >= 2 && options.length <= 4,
      'Poll must have between 2 and 4 options.',
    ), assert(
      options.length == percentages.length,
      'The number of options and percentages must be the same.',
    ), assert(
      percentages.fold(0, (sum, value) => sum + value) == 100,
      'The total sum of all percentages must equal exactly 100.',
    );

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  int? selectedOption;
  bool showResult = false;

  String get _timeRemainingText {
    final duration = widget.endTime.difference(DateTime.now());

    if (duration.isNegative) {
      return 'Poll ended';
    }

    final int days = duration.inDays;
    final int hours = duration.inHours % 24; // Use modulo to get remaining hours after days

    return 'Poll ends in ${days}d ${hours}h';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 28, right: 16, bottom: 24),
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(widget.question,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333733),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(
                widget.options.length,
                    (index) => _buildOption(index),
              ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/images/user_icon.png'))
                        ),
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          Text('by', style: TextStyle(fontSize: 13, color: Color(0xFF848D84),),),
                          SizedBox(width: 3),
                          Text(widget.pollCreator, style: TextStyle(fontSize: 13, color: Color(0xFF505C50),),),
                        ],
                      ),
                    ],
                  ),
                  Text(_timeRemainingText, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF848D84),),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index){
    final bool isSelected = selectedOption == index;
    return Column(
      children: [
        GestureDetector(
          onTap: showResult ? null : () {
            setState(() {
              selectedOption = index;
              showResult = true;
            });
          },

          child: Stack(
            children: [
              Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color (0xFFF5F6F5),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              if (showResult)...[
                FractionallySizedBox(
                  widthFactor: widget.percentages[index] / 100,
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFFC0F686) : Color(0xFFE2F5CD),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
              Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: AssetImage(
                              isSelected ? 'assets/icons/checkbox_rounded_selected.png' : (showResult) ? 'assets/icons/checkbox_rounded_result.png' : 'assets/icons/checkbox_rounded_default.png'
                          ), height: 24, width: 24,),
                          SizedBox(width: 8),
                          Text(widget.options[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF3C4049),
                              )
                          ),
                        ],
                      ),
                      if (showResult)...[
                        Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: Text('${widget.percentages[index]}%',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF848D84),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 6),
      ],
    );
  }

}


