import 'package:flutter/material.dart';
import 'package:freya/screens/home/components/body.dart';
import 'package:freya/components/bottom_navbar.dart';
import 'package:freya/enums.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Body(),
          ),
          BottomNavBar(selectedMenu: MenuState.home),
        ],
      ),
    );
  }
}
