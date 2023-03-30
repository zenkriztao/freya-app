import 'package:flutter/material.dart';
import 'package:freya/screens/test_curhat/components/body.dart';
import 'package:freya/size_config.dart';

class Curhat1Screen extends StatelessWidget {
  static String routeName = "/curhat1";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
