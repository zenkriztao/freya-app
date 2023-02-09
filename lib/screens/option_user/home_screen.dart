import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
