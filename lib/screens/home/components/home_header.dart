import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: getScreenHeight(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(60),
            ),
            gradient: LinearGradient(
              colors: [Color.fromARGB(246, 175, 67, 67), Color.fromARGB(255, 209, 131, 131)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: getScreenWidth(320),
            height: getScreenHeight(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(120),
                bottomLeft: Radius.circular(40)
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 155, 113, 119),
                  Color.fromARGB(255, 148, 147, 147),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Text(
                "Welcome Back, Sarah!",
                style: TextStyle(
                  fontSize: getScreenWidth(18),
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
