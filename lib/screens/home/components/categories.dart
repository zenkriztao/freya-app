import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/eclipse.svg"},
      {"icon": "assets/icons/eclipse.svg"},
      {"icon": "assets/icons/eclipse.svg"},
      {"icon": "assets/icons/eclipse.svg"},
      {"icon": "assets/icons/eclipse.svg"},
    ];
    return Padding(
      padding: EdgeInsets.all(getScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getScreenWidth(5)),
              height: getScreenWidth(55),
              width: getScreenWidth(55),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
