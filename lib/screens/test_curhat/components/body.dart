import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import '../../../components/share_button.dart';
import '../../test_curhat/curhat1_screen.dart';
import '../../tweet/tweet_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(40)),
                child: Text(
                  "It doesn't mean to show off about our problems, besides what is there to be proud of from our problems. We are just being meticulous about this in our heads and need to blow up this problem so that the burden feels less.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 167, 160, 160),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
            child: ShareButton(
              text: "Share",
              press: () {
                Navigator.pushNamed(context, TweetScreen.routeName);
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
