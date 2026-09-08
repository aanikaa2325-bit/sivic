import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentStatus extends StatelessWidget {
  final bool succeeded;
  final DateTime? issuedOn;
  final String? paymentMethod;
  final String? transactionID;
  final int? amount;


  const PaymentStatus.success({
    super.key,
    required this.issuedOn,
    required this.paymentMethod,
    required this.transactionID,
    required this.amount,
  }) : succeeded = true;

  const PaymentStatus.failed({super.key})
      : succeeded = false,
        issuedOn = null,
        paymentMethod = null,
        transactionID = null,
        amount = null;



  @override
  Widget build(BuildContext context) {

    String formattedDate = issuedOn != null
        ? DateFormat('yyyy-MM-dd  hh:mm a').format(issuedOn!)
        : 'N/A';

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/icons/back.png',
            height: 48,
            width: 48,
          ),
          padding: const EdgeInsets.only(left: 16),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  if (!succeeded)...[
                    SizedBox(height: 248),
                  ],
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      color: succeeded ? Color(0xFFC0F686) : Color(0xFFF86B59),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(succeeded ? 'assets/icons/success.png' : 'assets/icons/failed.png'),
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(succeeded ? 'Payment Completed' : 'Payment Failed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E241E),
                    )
                  ),
                  SizedBox(height: 40),
                  if (succeeded)...[
                    Column(
                      spacing: 18.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Issued on',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF525D52),
                              )
                            ),
                            Text(formattedDate,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF303230),
                                )
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Payment method',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF525D52),
                                )
                            ),
                            Text(paymentMethod!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF303230),
                                )
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Transaction ID',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF525D52),
                                )
                            ),
                            Text(transactionID!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF303230),
                                )
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Amount',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF525D52),
                                )
                            ),
                            Text('$amount',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF303230),
                                )
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Status',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF525D52),
                                )
                            ),
                            Text('Succeeded',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF303230),
                                )
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18, right: 22.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image(image: AssetImage('assets/icons/receipt.png'), height: 20, width: 20,),
                                    SizedBox(width: 8),
                                    Text('Download receipt',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF303230),
                                        )
                                    ),
                                  ],
                              ),
                            ),
                          ),
                        ),
                      ],

                    ),
                  ]
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xFF1C1F1C),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text('Go back',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
