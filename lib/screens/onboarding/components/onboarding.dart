import 'package:flutter/material.dart';
import 'package:freya/constant/constants.dart';
import 'package:freya/constant/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

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
          "assets/logo.png",
          height: getScreenHeight(60),
          width: getScreenWidth(160),
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getScreenHeight(265),
          width: getScreenWidth(235),
        ),
        SizedBox(
            height:
                getScreenHeight(10)), // add this line to adjust the position
        Text(
          text!,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: getScreenWidth(24),
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        SizedBox(
            height:
                getScreenHeight(0.1)), // add this line to adjust the position
        Text(
          textColor!,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: getScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 77, 154, 171),
          ),
        ),
      ],
    );
  }
}
