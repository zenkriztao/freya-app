import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'package:freya/screens/account/components/body.dart';
import 'package:freya/components/bottom_navbar.dart';
import 'package:freya/enums.dart';

class AccountScreen extends StatelessWidget {
  @override
  static String routeName = './account';
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
