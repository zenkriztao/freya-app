import 'package:flutter/material.dart';
import 'package:freya/screens/onboarding/components/body.dart';
import 'package:freya/constant/size_config.dart';

class OnboardingScreen extends StatelessWidget {
    static String routeName = "/onboarding";
    @override
    Widget build(BuildContext context) {
        SizeConfig().init(context);
        return Scaffold(
            body: Body(),
        );
    }
}