import 'package:flutter/material.dart';
import 'package:sivic/screens/add_complaint.dart';
import 'package:sivic/screens/home_page.dart';
import 'package:sivic/widgets/selection.dart';
import 'package:sivic/screens/terms_of_use.dart';
import 'package:sivic/screens/profile.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const AddComplaint(),
    const Selection(),
    const TermsOfUse(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (Set<WidgetState> states) {
              return TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: states.contains(WidgetState.selected)
                    ? const Color(0xFF333733)
                    : const Color(0xFF848D84),
              );
            },
          ),
        ),
        child: NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFC0F686),
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          selectedIndex: currentIndex,

          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Image.asset('assets/icons/home.png', width: 24, height: 24),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Image.asset('assets/icons/complaint.png', width: 24, height: 24),
              label: 'Complaints',
            ),
            NavigationDestination(
              icon: Image.asset('assets/icons/feed.png', width: 24, height: 24),
              label: 'Feed',
            ),
            NavigationDestination(
              icon: Image.asset('assets/icons/budget.png', width: 24, height: 24),
              label: 'Budget',
            ),
            NavigationDestination(
              icon: Image.asset('assets/icons/crowdfund.png', width: 24, height: 24),
              label: 'Crowdfund',
            ),
          ],
        ),
      ),
    );
  }
}