import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freya/size_config.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
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
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: getScreenHeight(20)),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Text(
                  "20 minutes ago",
                  style: TextStyle(
                      color: Colors.grey, fontSize: getScreenHeight(12)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
                "Mental health is a condition in which individuals have visible well-being. Mental health is a condition in which individuals have visible well-being. Mental health is a condition in which individuals have visible well-being."),
            SizedBox(height: 10),
            Divider(),
            Row(
              children: [
                SvgPicture.asset("assets/icons/love-icon.svg"),
                SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
