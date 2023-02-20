import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Welcome Back",
            style: TextStyle(
                fontSize: getScreenWidth(28),
                color: Color.fromARGB(255, 218, 84, 84),
                fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset("assets/icons/sms-icon.svg"),
        ],
      ),
    );
  }
}