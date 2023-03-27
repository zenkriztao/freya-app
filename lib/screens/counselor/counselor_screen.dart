import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/screens/counselor/components/body.dart';

class CounselorScreen extends StatelessWidget {
  static String routeName = "/counselor";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
