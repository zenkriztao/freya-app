import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/screens/home/components/body.dart';
import 'package:freya/components/bottom_navbar.dart';
import 'package:freya/enums.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
