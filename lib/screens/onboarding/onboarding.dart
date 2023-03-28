import 'package:flutter/material.dart';
import 'package:freya/screens/onboarding/components/body.dart';
import 'package:freya/size_config.dart';

class SplashScreen extends StatelessWidget {
    static String routeName = "/onboarding";
    @override
    Widget build(BuildContext context) {
        SizeConfig().init(context);
        return Scaffold(
            body: Body(),
        );
    }
}