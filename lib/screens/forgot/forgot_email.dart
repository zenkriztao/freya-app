import 'package:flutter/material.dart';
import 'components/email.dart';
import 'package:freya/size_config.dart';

class ForgotEmail extends StatelessWidget {
  static String routeName = "/email";
    @override
    Widget build(BuildContext context) {
        SizeConfig().init(context);
        return Scaffold(
            body: Email(),
        );
    }
}
