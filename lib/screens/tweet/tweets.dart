import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Tweets extends StatelessWidget {
  const Tweets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sarah",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Text(
                  "20 minutes ago",
                  style: GoogleFonts.nunito(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
                "Mental health is a condition in which individuals have visible well-being. Mental health is a condition in which individuals have visible well-being. Mental health is a condition in which individuals have visible well-being.", 
                style: GoogleFonts.nunito(
                  fontSize: 15,
                )),
            SizedBox(height: 10),
            Divider(color: Color(0xFFCB5C6C)),
            Row(
              children: [
                SvgPicture.asset("assets/icon/love-icon.svg"),
                SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
