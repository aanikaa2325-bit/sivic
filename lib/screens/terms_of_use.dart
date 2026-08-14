import 'package:flutter/material.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
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
          title: const Text('Terms of Use',
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
            controller: _scrollController,
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
                        const Text('Terms of Use',
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
                          'Welcome to Sivic. These Terms of Use ("Terms") govern your access to and use of the Sivic mobile application and related services (collectively, the "Platform"). By creating an account or using the Platform, you agree to be bound by these Terms.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('1.  Description of Service',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Sivic is a civic engagement platform designed to connect citizens with their local municipalities. The Platform provides tools for:',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start, // Added alignment
                          children: [
                            const Text('1 . 1  Complaint Reporting: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'Alerting local authorities to ',
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
                          'infrastructural issues (e.g., broken roads, water leakages, overflowing garbage).',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start, // Added alignment
                          children: [
                            const Text('1 . 2  Budget Transparency: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'Tracking municipal budget ',
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
                          'allocations and approved expenditures.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start, // Added alignment
                          children: [
                            const Text('1 . 3  Public Polls: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'Participating in community surveys ',
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
                          'and discussions regarding local initiatives.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start, // Added alignment
                          children: [
                            const Text('1 . 4  Crowdfunding: ',
                              style: TextStyle(
                                height: 1.6,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                            ),
                            Expanded(
                              child: const Text(
                                'Contributing financially to ',
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
                          'community-driven civic projects.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('2.  User Accounts and Verification',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'To fully access the Platform, you must register for an account. Registration requires the submission of accurate personal information, including your full name, valid email address, phone number, and National ID (NID). You are responsible for maintaining the confidentiality of your login credentials and for all activities that occur under your account.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('3. User Conduct and Content',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'When using the Platform, specifically the Complaint Module and Community Feed, you agree to the following:',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          '• You will only report genuine, verifiable issues. Deliberately submitting false reports or doctored photo references is strictly prohibited.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• You will not upload content that is abusive, defamatory, or violates the privacy of others.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• You grant Sivic a non-exclusive, royalty-free license to use, display, and share the data and photos you submit with relevant municipal authorities for the purpose of issue resolution.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('4.  Crowdfunding and Payments',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Sivic facilitates crowdfunding for local initiatives. By participating as a backer:',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          '• All payments are processed securely through authorized third-party gateways (e.g., bKash, Nagad, Rocket). Sivic does not store your direct financial credentials.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• Contributions made to crowdfunding campaigns are voluntary donations. Unless a project is canceled prior to fund disbursement, donations are generally non-refundable.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '• Sivic tracks the progress and execution of funded projects but is not ultimately liable for project delays caused by external contractors or municipal bodies.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('5.  Disclaimers and Limitations of Liability',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Sivic acts as an intermediary platform between citizens and local government bodies. While we strive to ensure reports are routed efficiently and budgets are displayed accurately, Sivic does not guarantee that municipal authorities will resolve every reported complaint within a specific timeframe. Sivic is not liable for infrastructural damages, physical injuries, or municipal negligence.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            color: Color(0xFF333733),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('6.  Governing Law',
                          style: TextStyle(
                            height: 1.6,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1F1C),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'These Terms shall be governed by and construed in accordance with the laws of Bangladesh, without regard to its conflict of law provisions.',
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