import 'package:flutter/material.dart';
import 'package:freya/components/loginCard.dart';
import '../../../size_config.dart';
import 'forgot_content.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Color.fromARGB(255, 135, 43, 43),
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Column(children: [
                SizedBox(height: SizeConfig.screenHeight * 0.2),
                Text(
                  "Forget Password",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: getScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        SizedBox(height: getScreenHeight(10)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ForgotContent(),
                        ),
                        SizedBox(height: getScreenHeight(24)),
                      ],
                    ),
                  ],
                )
              ])),
            )));
  }
}
