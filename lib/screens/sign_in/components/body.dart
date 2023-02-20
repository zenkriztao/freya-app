import 'package:flutter/material.dart';
import 'package:freya/components/loginCard.dart';
import '../../../size_config.dart';
import 'sign_in_content.dart';

class Body extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Container(
          color: Color.fromARGB(255, 212, 71, 71),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: 
            EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Image.asset(
                  "assets/images/logo_white.png",
                  height: getScreenHeight(150),
                  width: getScreenWidth(200),
                ),
                Text(
                  "Log In",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: getScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Stack(
                children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1.5,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              SizedBox(height: getScreenHeight(10)),
              SignInContent(),
              SizedBox(height: getScreenHeight(24)),
            ],
              ),
            ],
            )
          ),
          )
        )
        )
      );
    }
}