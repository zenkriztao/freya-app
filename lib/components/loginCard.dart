import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final String? press;

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press as void Function()?,
        child: Container(
            margin: 
                EdgeInsets.symmetric(horizontal : getScreenWidth(10)),
            padding: EdgeInsets.all(getScreenWidth(12)),
            height: getScreenHeight(78),
            width: getScreenWidth(65),
            decoration: BoxDecoration(
              color: Color(0xFFFFFF),
              shape: BoxShape.circle,
            ),
        child: SvgPicture.asset(icon!),
        ),
    );
  }
}
