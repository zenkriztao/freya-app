import 'package:flutter/material.dart';
import 'package:freya/screens/home/home_screen.dart';
import 'package:freya/size_config.dart';
import 'package:freya/constants.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Lorem ipsum dolor sit \n amet, consectetur",
      "image": "assets/images/women_1.png"
    },
    {
      "text": "Lorem ipsum dolor sit \n amet, consectetur",
      "image": "assets/images/women_2.png"
    },
    {
      "text": "Lorem ipsum dolor sit \n amet, consectetur",
      "image": "assets/images/women_6.png"
    },
    {
      "text": "Lorem ipsum dolor sit \n amet, consectetur",
      "image": "assets/images/women_7.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    DefaultButton(
                        text: "Try it out",
                        press: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        }),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
