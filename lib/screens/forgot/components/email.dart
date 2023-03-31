import 'package:flutter/material.dart';
import 'package:freya/components/loginCard.dart';
import '../../../size_config.dart';

class Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Color.fromARGB(255, 135, 43, 43),
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Column(children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text(
                  "Forgot Password",
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
                        SizedBox(height: getScreenHeight(30)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 60),
                          child: Text(
                            "Check your email",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 100),
                          child: Text(
                            "We have sent a password recovery instruction to your registered email.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 77, 77, 77),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: getScreenHeight(24)),
                        SizedBox(height: getScreenHeight(20)),
                      ],
                    ),
                  ],
                )
              ])),
            )));
  }
}
