import 'package:flutter/material.dart';
import 'package:freya/screens/appointment/appointment_list.dart';
import '../../../components/sign_button.dart';
import '../../chat/chat_screen.dart';
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
            text: "Make Appointment",
            press: () {
              // if (_globalKey.currentState!.validate()) {
              //   _globalKey.currentState!.save();
                Navigator.pushNamed(context, AppointmentList.routeName);
              // }
            },
          ),
            ],
          ),
        ),
      ),
    );
  }
}
