import 'package:flutter/material.dart';
import '../../../components/sign_button.dart';
import './report_form.dart';

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
              SizedBox(height: 50),
              Text(
                "Make Appointment",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 185, 74, 74),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ReportForm(),
              SignButton(
                text: "Report",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
