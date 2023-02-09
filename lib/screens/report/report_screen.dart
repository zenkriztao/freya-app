import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/screens/report/components/body.dart';

class ReportScreen extends StatelessWidget {
  static String routeName = "/report";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}