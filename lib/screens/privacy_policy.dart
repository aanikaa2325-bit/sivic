import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      bool isScrolledNow = _scrollController.offset > 0;
      if (isScrolledNow != _isScrolled) {
        setState(() {
          _isScrolled = isScrolledNow;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize (
        preferredSize: const Size.fromHeight(88),
        child: AppBar(
          toolbarHeight: 88,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Image.asset(
              _isScrolled ? 'assets/icons/back_scrolled.png' : 'assets/icons/back.png',
              height: 48,
              width: 48,
            ),
            padding: const EdgeInsets.only(left: 16),
          ),
          title: const Text('Privacy Policy',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E241E),
            ),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController, // 4. CONTROLLER ATTACHED HERE
            // 5. REMOVED THE 'Expanded' WIDGET THAT WAS CAUSING A LAYOUT CRASH
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 114,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/terms_cover.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/document.png',
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(width: 12),
                        const Text('Privacy Policy',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text ('Last updated: Aug 06, 2026',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF848D84),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Your privacy is important to us. This Privacy Policy explains how Sivic collects, uses, shares, and protects your personal information when you use our mobile application to engage with your local community and government.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('1.  Information We Collect',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'We collect information you provide directly to us, as well as data automatically gathered during your Suse of the Platform:',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('1 . 1  Personal Identification Data: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'First name, last name, ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 14,
                                  color: Color(0xFF333733),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'phone number, email address, and National ID (NID) collected during account registration and verification.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('1 . 2  Location Data ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'Precise GPS location data is required ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 14,
                                  color: Color(0xFF333733),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'to accurately map and report civic complaints (e.g., pinpointing a broken street lamp).',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('1 . 3  User-Generated Content: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'Photos of civic issues,  ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 14,
                                  color: Color(0xFF333733),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'descriptions, and your responses to public polls.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('1 . 4  Financial Information: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'When you participate in ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 14,
                                  color: Color(0xFF333733),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'crowdfunding, we collect transaction records (e.g., amount, Transaction ID, timestamp, bKash numbers). We do not store full bank or credit card details.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('2.  How We Use Your Information',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Your data is utilized to deliver and improve our services:',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          '• To verify your identity and maintain the integrity of civic reports.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• To precisely locate and route your reported complaints to the correct municipal ward or government department.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• To process crowdfunding transactions and issue receipts.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• To populate the Community Feed with relevant nearby activity and polls.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• To track and display local budget expenditures geographically relevant to you.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('3.  Information Sharing and Disclosure', // Fixed numbering here
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Because Sivic bridges the gap between citizens and the government, information sharing is essential:',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('3 . 1  Municipal Authorities: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'Your complaints, including ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 14,
                                  color: Color(0xFF333733),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'location data, photos, and descriptions, are shared with relevant government bodies to facilitate resolution. Depending on the local government\'s policy, your name may be attached to the report.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('3 . 2  Public Community Feed: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'Aggregated complaints ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 14,
                                  color: Color(0xFF333733),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'and poll results are visible to other citizens in your area. You may choose to make specific reports anonymous to the public, though they remain identified to administrators.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('3 . 3  Service Providers: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'We share necessary data with ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 14,
                                  color: Color(0xFF333733),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'authorized third-party vendors, such as OTP verification services and payment gateways (e.g., bKash).',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('3 . 4  Legal Compliance: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'We may disclose information if ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 14,
                                  color: Color(0xFF333733),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'required by law or in response to valid requests by public authorities.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('4. Data Security',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'We implement robust industry-standard security measures, including encryption and secure servers, to protect your personal data, especially sensitive information like your NID and transaction histories, from unauthorized access or alteration.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('5.  Your Rights',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'You have the right to access the personal information we hold about you, request corrections to inaccurate data, or request the deletion of your account. Please note that certain data, such as records of past civic complaints or finalized financial transactions, may be retained for public record and legal compliance purposes.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('6.  Contact Us',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'If you have any questions or concerns regarding this Privacy Policy or our data practices, please contact our support team via the help section within the Sivic app or email us at privacy@sivic.domain.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 48),
                        const Text ('© 2026 Sivic. All rights reserved.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF505C50),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}