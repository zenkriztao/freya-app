import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../../components/sign_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 250),
              Text(
                "Are you a User or a Psychologists?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 185, 74, 74),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Please choose your option",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SignButton(
                text: "User",
                press: () {},
              ),
              SizedBox(height: 20),
              DefaultButton(
                text: "Psychologists",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  } 
} 
