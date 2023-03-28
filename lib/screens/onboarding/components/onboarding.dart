import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    this.text,
    this.textColor,
    this.image,
  }) : super(key: key);
  final String? text, image, textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image.asset(
          "assets/images/logo.png",
          height: getScreenHeight(60),
          width: getScreenWidth(160),
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getScreenHeight(265),
          width: getScreenWidth(235),
        ),
        Spacer(flex: 1),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getScreenWidth(24),
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
         Text(
          textColor!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 77, 154, 171)
          ),
        ),
      ],
    );
  }
}