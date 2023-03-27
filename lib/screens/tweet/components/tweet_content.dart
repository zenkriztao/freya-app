import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freya/size_config.dart';
import '../../../components/share_button.dart';

class TweetContent extends StatelessWidget {
  static const List<Map<String, dynamic>> tweets = [
    {
      "name": "Sarah",
      "desc":
          "It is health that is real wealth and not pieces of gold and silver.",
      "time": "20 minutes ago"
    },
    {
      "name": "Watila",
      "desc":
          "It is health that is real wealth and not pieces of gold and silver.",
      "time": "30 minutes ago"
    },
    {
      "name": "Cika",
      "desc":
          "It is health that is real wealth and not pieces of gold and silver.",
      "time": "40 minutes ago"
    }
  ];

  final int index;

  const TweetContent({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index >= tweets.length) {
      return Container(); // return empty container if index is out of bounds
    }
    final tweet = tweets[index];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tweet['name'] ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: getScreenHeight(20)),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 5),
                Text(
                  tweet['time'] ?? '',
                  style: TextStyle(
                      color: Colors.grey, fontSize: getScreenHeight(12)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(tweet['desc'] ?? ''),
            SizedBox(height: 10),
            Divider(),
            Row(
              children: [
                SvgPicture.asset("assets/icons/love-icon.svg"),
                SizedBox(width: 5),
                SizedBox(width: 10),
                SvgPicture.asset("assets/icons/icon-comment.svg"),
                SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
