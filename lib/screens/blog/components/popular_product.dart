import 'package:flutter/material.dart';
import 'package:freya/components/blog_card.dart';
import 'package:freya/models/Blogspot.dart';
import 'package:freya/screens/blog/blog_page_screen.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: SectionTitle(
            title: "Informations",
            press: () {},
          ),
        ),
        SizedBox(height: getScreenWidth(20)),
        Row(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: getScreenWidth(7))),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...List.generate(
                    demoBlogspots.length,
                    (index) {
                      if (demoBlogspots[index].isPopular)
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlogScreenPage(
                                ),
                              ),
                            );
                          },
                          child: BlogspotCard(blog: demoBlogspots[index]),
                        );
                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(height: getScreenWidth(20)),
                ],
              ),
            ),
            SizedBox(width: getScreenWidth(10)),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...List.generate(
                    demoBlogspots.length,
                    (index) {
                      if (demoBlogspots[index].isPopular)
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlogScreenPage(
                                ),
                              ),
                            );
                          },
                          child: BlogspotCard(blog: demoBlogspots[index]),
                        );
                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(height: getScreenWidth(20)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
