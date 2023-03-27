import 'package:flutter/material.dart';
import 'package:freya/screens/splas/components/body.dart';
import 'package:freya/size_config.dart';

class SplasScreen extends StatelessWidget {
  static String routeName = './splas';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
