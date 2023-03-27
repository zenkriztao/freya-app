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
          EdgeInsets.symmetric(horizontal: getScreenWidth(110)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Select Counselor",
            style: TextStyle(
                fontSize: getScreenWidth(20),
                color: Color.fromARGB(255, 218, 84, 84),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}