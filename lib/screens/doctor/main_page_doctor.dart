import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:freya/screens/chat/chats.dart';
import 'package:freya/screens/my_profile.dart';
import 'package:freya/screens/patient/appointments.dart';
import 'package:iconsax/iconsax.dart';

class MainPageDoctor extends StatefulWidget {
  const MainPageDoctor({Key? key}) : super(key: key);

  @override
  State<MainPageDoctor> createState() => _MainPageDoctorState();
}

class _MainPageDoctorState extends State<MainPageDoctor> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const Appointments(),
    const Chats(),
    const MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: GNav(
                curve: Curves.easeOutExpo,
                rippleColor: Colors.grey.shade300,
                hoverColor: Colors.grey.shade100,
                haptic: true,
                tabBorderRadius: 20,
                gap: 5,
                activeColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 200),
                tabBackgroundColor: Color(0xFFE35970),
                textStyle: GoogleFonts.nunito(
                  color: Colors.white,
                ),
                iconSize: 30,
                tabs: const [
                  GButton(
                    icon: Iconsax.calendar_1,
                    text: 'All Appointments',
                  ),
                   GButton(
                    icon: Iconsax.messages /* Typicons.group_outline */,
                    text: 'Chats User',
                  ),
                  GButton(
                    icon: Iconsax.frame_1,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: _onItemTapped,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
