import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:freya/size_config.dart';

class ForgotScreen extends StatelessWidget {
  static String routeName = "/forgot";
    @override
    Widget build(BuildContext context) {
        SizeConfig().init(context);
        return Scaffold(
            body: Body(),
        );
    }
}
