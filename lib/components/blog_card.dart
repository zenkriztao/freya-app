import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freya/models/Blogspot.dart';
import 'package:freya/screens/blog/components/popular_product.dart';
import 'package:freya/screens/home/components/popular_card.dart';
import '../constants.dart';
import '../size_config.dart';

class BlogspotCard extends StatelessWidget {
  const BlogspotCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.blog,
  }) : super(key: key);

  final double width, aspectRetio;
  final Blogspot blog;

  @override
  Widget build(BuildContext context) {
    return 
        SizedBox(
        height: getScreenHeight(190),
        width: getScreenWidth(180),
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: blog.id.toString(),
                child: Image.asset(
                  blog.images[0],
                ),
              ),
              const SizedBox(height: 1),
            ],
          ),
      ),
    );
  }
}
