import 'package:flutter/material.dart';

class BannerModel {
  String text;
  List<Color> cardBackground;
  String image;

  BannerModel(this.text, this.cardBackground, this.image);
}

List<BannerModel> bannerCards = [
  BannerModel(
      "Lorem Ipsum",
      [
      ],
      "assets/emergency.png"),
];
