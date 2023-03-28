import 'package:flutter/material.dart';
import 'package:freya/screens/splash/components/body.dart';
import 'package:freya/size_config.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = './splash';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
