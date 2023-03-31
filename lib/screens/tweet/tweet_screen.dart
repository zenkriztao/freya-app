import 'package:flutter/material.dart';
import 'package:freya/screens/tweet/components/body.dart';
import 'package:freya/size_config.dart';
import 'package:freya/components/bottom_navbar.dart';
import 'package:freya/enums.dart';

class TweetScreen extends StatelessWidget {
  static String routeName = "/tweet";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Body(),
          ),
          BottomNavBar(selectedMenu: MenuState.favourite),
        ],
      ),
    );
  }
}
