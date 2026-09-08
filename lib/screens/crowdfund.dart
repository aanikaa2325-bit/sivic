import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sivic/widgets/budget_bar_expanded.dart';
import 'package:sivic/widgets/crowdfund_card.dart';
import 'package:sivic/widgets/expenditure.dart';
import 'package:sivic/screens/payment_status.dart';


class Crowdfund extends StatefulWidget {
  const Crowdfund({super.key});

  @override
  State<Crowdfund> createState() => _CrowdfundState();
}

class _CrowdfundState extends State<Crowdfund> {

  final TextEditingController _amountController = TextEditingController();

  int ? _quickAmountIndex;
  int notificationCount = 3;
  String sort_by = 'Newest';

  void _showBackingBottomSheet(BuildContext context) {
    setState(() {
      _quickAmountIndex = null;
      _amountController.clear();
    });
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState){
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 28, left: 16, right: 16, bottom: 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 36,
                              width: 36,
                            ),
                            Text('Back project',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1E241E),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Image(image: AssetImage('assets/icons/close.png'), height: 36, width: 36,)
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        Text('Donation amount', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF333733),),),
                        SizedBox(height: 14),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 32.0, bottom: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('৳', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF276F27),),),
                                      SizedBox(
                                        width: 160,
                                        child: TextField(
                                          controller: _amountController,
                                          textAlign: TextAlign.center,
                                          cursorColor: Color(0xFF437043),
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF333733),
                                          ),
                                          decoration: InputDecoration(
                                            hintText: '0',
                                            hintStyle: TextStyle(
                                              color: Color(0xFFDADFDA),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(0),
                                              borderSide: BorderSide(color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(0),
                                              borderSide: BorderSide(color: Colors.transparent),
                                            ),
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0.0,
                                              vertical: 0.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          setModalState(() {
                                            _amountController.clear();
                                          });
                                        },
                                        child: Image(image: AssetImage('assets/icons/cancel.png'), height: 16, width: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  height: 1.5,
                                  width: double.infinity,
                                  color: Color(0xFFE4E8E4),
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text('Quick select',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF525D52),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          _quickAmountIndex = 0;
                                          _amountController.text = '500';
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: _quickAmountIndex == 0 ? Color(0xFFC0F686) : Colors.transparent,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Color(0xFFE4E8E4), width: 1.25),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Center(child: Text('৳ 500', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF333733),),)),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          _quickAmountIndex = 1;
                                          _amountController.text = '1000';
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: _quickAmountIndex == 1 ? Color(0xFFC0F686) : Colors.transparent,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Color(0xFFE4E8E4), width: 1.25),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Center(child: Text('৳ 1,000', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF333733),),)),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          _quickAmountIndex = 2;
                                          _amountController.text = '2000';
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: _quickAmountIndex == 2 ? Color(0xFFC0F686) : Colors.transparent,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Color(0xFFE4E8E4), width: 1.25),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Center(child: Text('৳ 2,000', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF333733),),)),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          _quickAmountIndex = 3;
                                          _amountController.text = '5000';
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: _quickAmountIndex == 3 ? Color(0xFFC0F686) : Colors.transparent,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Color(0xFFE4E8E4), width: 1.25),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Center(child: Text('৳ 5,000', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF333733),),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ),
                        SizedBox(height: 14),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentStatus.success(
                                  issuedOn: DateTime.now(),
                                  paymentMethod: 'Credit Card',
                                  transactionID: '12345',
                                  amount: 5000,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xFF1C1F1C),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text('Proceed with payment',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        );
      },
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 28),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Crowdfund',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E241E),
                        ),
                      ),
          
                      Stack(
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/icons/notification.png',
                            ),
                            height: 30,
                            width: 30,
                          ),
          
                          Positioned(
                            right: 0,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 10.0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image(image: AssetImage('assets/icons/sort.png'), height: 16, width: 16),
                                SizedBox(width: 6),
                                Text(sort_by,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF303230),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Image(image: AssetImage('assets/icons/arrow_down.png'), height: 20, width: 20),
          
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C1F1C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 18.0),
                        child: Row(
                          children: [
                            Image(image: AssetImage('assets/icons/add_white.png'), height: 16, width: 16),
                            SizedBox(width: 6),
                            Text('New initiative',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  spacing: 8.0,
                  children: [
                    CrowdfundCard(
                      timeLeft: 12,
                      raised: 9875,
                      goal: 13715,
                      projectName: 'Hatirjheel Park Roadside Trash',
                      backedBy: 45,
                      userName: 'Farhan Akmal',
                      profilePhoto: 'assets/images/user_icon.png',
                      description: 'Raising fund for placing trash cans nearside Hatirjheel Lake area.',
                      imageData: 'assets/images/complaint_image_1.png',
                      onBackTap: () => _showBackingBottomSheet(context),
                    ),
                    CrowdfundCard(
                      timeLeft: 12,
                      raised: 9875,
                      goal: 13715,
                      projectName: 'Hatirjheel Park Roadside Trash',
                      backedBy: 45,
                      userName: 'Farhan Akmal',
                      profilePhoto: 'assets/images/user_icon.png',
                      description: 'Raising fund for placing trash cans nearside Hatirjheel Lake area.',
                      onBackTap: () => _showBackingBottomSheet(context),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}