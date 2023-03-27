import 'package:flutter/material.dart';
import 'package:freya/components/loginCard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';
import 'account_content.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Color.fromARGB(255, 135, 43, 43),
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Sarah Mintas",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: getScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset("assets/icons/edit-icon.svg"),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(height: getScreenHeight(10)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: AccountContent(),
                      ),
                      SizedBox(height: getScreenHeight(24)),
                    ],
                  ),
                ],
              )),
            )));
  }
}
