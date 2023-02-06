import 'package:flutter/material.dart';
import 'package:freya/components/loginCard.dart';

import '../../../size_config.dart';
import 'sign_in_content.dart';

class Body extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: 
            EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.23),
                Text(
                  "Log In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              SignInContent(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "Or",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getScreenWidth(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginCard(
                    icon: "assets/icons/google-icon.svg",
                  ),
                  LoginCard(
                    icon: "assets/icons/apple-icon.svg",
                  ),
                  LoginCard(
                    icon: "assets/icons/facebook-icon.svg",
                  ),
                ],
              ),
              SizedBox(height: getScreenHeight(24)),
              Text(
                "Don't have an account yet? Sign Up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getScreenWidth(16),
                  fontWeight: FontWeight.bold,
                )
              )
            ],
            )
          ),
          )
        )
      );
    }
}