import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:freya/size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
    @override
    Widget build(BuildContext context) {
        SizeConfig().init(context);
        return Scaffold(
            body: Body(),
        );
    }
}
