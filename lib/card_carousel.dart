import 'package:flutter/material.dart';
import 'package:freya/webview/article_help.dart';
import 'package:freya/webview/article_mental.dart';
import 'package:freya/webview/article_solution.dart';
import 'package:freya/webview/article_violence.dart';
import 'package:freya/model/card_banner.dart';

class CardCarousel extends StatelessWidget {
  const CardCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity, // Menggunakan ukuran maksimum yang tersedia
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: 10), // Memberikan jarak antar sisi
        scrollDirection: Axis.horizontal,
        itemCount: bannerCards.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
                right: 20), // Memberikan jarak antara item
              child: GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ArticleViolence(),
                      ),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ArticleSolution(),
                      ),
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ArticleMental(),
                      ),
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ArticleHelp(),
                      ),
                    );
                  }
                },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Image.asset(
                  bannerCards[index].image,
                  //'assets/414.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
