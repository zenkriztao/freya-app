import 'package:flutter/material.dart';
import 'package:freya/screens/curhat/components/body.dart';
import 'package:freya/size_config.dart';

class CurhatScreen extends StatelessWidget {
  static String routeName = "/curhat";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
