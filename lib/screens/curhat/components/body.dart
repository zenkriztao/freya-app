import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import '../../../components/share_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Column(children: [
              SizedBox(height: 50),
              Text(
                "Sarah",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: getScreenWidth(30)),
                  child: Text("What you feels today",
                      style: TextStyle(
                        color: Color.fromARGB(255, 167, 160, 160),
                      ))),
            ]),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Spacer(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                  child: ShareButton(text: "Share"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
