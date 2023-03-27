import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freya/models/Dokter.dart';
import 'package:freya/screens/blog/components/popular_product.dart';
import 'package:freya/screens/home/components/popular_card.dart';
import '../constants.dart';
import '../size_config.dart';

class CounselorCard extends StatelessWidget {
  const CounselorCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.dokter,
  }) : super(key: key);

  final double width, aspectRetio;
  final Dokter dokter;

  @override
  Widget build(BuildContext context) {
    return 
        SizedBox(
        height: getScreenHeight(190),
        width: getScreenWidth(200),
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: dokter.id.toString(),
                child: Image.asset(
                  dokter.images[0],
                ),
              ),
              const SizedBox(height: 1),
            ],
          ),
      ),
    );
  }
}
