import 'package:flutter/material.dart';
import 'package:freya/screens/curhat/curhat_screen.dart';
import '../../../size_config.dart';
import '../../../components/share_button.dart';
import 'tweet_content.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: getScreenHeight(5)),
                SizedBox(height: getScreenHeight(20)),
                TweetContent(index: 0),
                SizedBox(height: getScreenWidth(30)),
                TweetContent(index: 1),
                SizedBox(height: getScreenWidth(30)),
                TweetContent(index: 2),
                SizedBox(height: getScreenWidth(30)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CurhatScreen()));
                  },
                  child: Text(
                    "Self Share",
                    style: TextStyle(
                        color: Colors.white, fontSize: getScreenWidth(20)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 174, 70, 62),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize:
                        Size(getScreenWidth(100) * 2, getScreenHeight(25) * 2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
