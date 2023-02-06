import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/constants.dart';

class Body extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text("Welcome Back", 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getScreenWidth(28),
                  fontWeight: FontWeight.bold,
                 ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}