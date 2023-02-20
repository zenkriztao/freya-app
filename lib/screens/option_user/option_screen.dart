import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/screens/option_user/components/body.dart';

class OptionScreen extends StatelessWidget {
  static String routeName = "/option";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
