import 'package:flutter/material.dart';
import 'package:freya/components/product_card.dart';
import 'package:freya/screens/blog/blog_screen.dart';
import 'package:freya/models/Product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: SectionTitle(
              title: "Blogspot",
              press: () {
                Navigator.pushNamed(context, BlogScreen.routeName);
              }),
        ),
        SizedBox(height: getScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogScreen(),
                          ),
                        );
                      },
                      child: ProductCard(product: demoProducts[index]),
                    );

                  return SizedBox.shrink();
                },
              ),
              SizedBox(width: getScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
