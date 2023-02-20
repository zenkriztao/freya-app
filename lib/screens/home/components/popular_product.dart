import 'package:flutter/material.dart';
import 'package:freya/components/product_card.dart';
import 'package:freya/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: SectionTitle(title: "Informations", press: () {}),
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
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
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
