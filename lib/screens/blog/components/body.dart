import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'blog_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
