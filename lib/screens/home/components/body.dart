import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getScreenWidth(10)),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
