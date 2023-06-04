import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:freya/screens/chat/chats.dart';
import 'package:freya/screens/my_profile.dart';
import 'package:freya/screens/patient/home_page.dart';
import 'package:freya/screens/patient/appointments.dart';
import 'package:iconsax/iconsax.dart';

class MainPagePatient extends StatefulWidget {
  const MainPagePatient({Key? key}) : super(key: key);

  @override
  State<MainPagePatient> createState() => _MainPagePatientState();
}

class _MainPagePatientState extends State<MainPagePatient> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const Appointments(),
    const Chats(),
    const MyProfile(),
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

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
                tabBackgroundColor: Color.fromARGB(255, 195, 60, 82),
                textStyle: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                tabs: const [
                  GButton(
                    iconSize: 28,
                    icon: Iconsax.home_14,
                    text: 'Home',
                  ),
                  GButton(
                    iconSize: 28,
                    icon: Iconsax.calendar_1,
                    text: 'Appointments',
                  ),
                  GButton(
                    iconSize: 28,
                    icon: Iconsax.messages,
                    text: 'Chat',
                  ),
                  GButton(
                    iconSize: 28,
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
