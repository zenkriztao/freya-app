import 'package:flutter/material.dart';
import 'package:freya/components/blog_card.dart';
import 'package:freya/screens/blog/blog_screen.dart';
import 'package:freya/screens/blog/components/popular_product.dart';
import '../../../size_config.dart';
import 'home_header.dart';
import 'categories.dart';
import 'popular_card.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: getScreenWidth(30)),
            SpecialOffers(),
            SizedBox(height: getScreenWidth(20)),
            PopularCards(),
            SizedBox(height: getScreenWidth(5)),
            PopularProducts()
          ],
        ),
      ),
    );
  }
}
