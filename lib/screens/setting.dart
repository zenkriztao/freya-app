import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/firestore_data/user_details.dart';
import 'package:iconsax/iconsax.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  UserDetails detail = const UserDetails();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  Future _signOut() async {
    await _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashRadius: 25,
            icon: const Icon(
              Iconsax.arrow_left,
              color: Color(0xFFE35970),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text(
          'User Settings',
          style: GoogleFonts.nunito(
              color: Color(0xFFE35970),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // info to edit
            const UserDetails(),

            // log out button
            Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 30, top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFE35970),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                  _signOut();
                },
                style: TextButton.styleFrom(primary: Colors.white),
                child: Text(
                  'Sign out',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
