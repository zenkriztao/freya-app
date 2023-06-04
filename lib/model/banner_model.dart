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
      "assets/female.png"),
      BannerModel(
      "Lorem ipsum",
      [
      ],
      "assets/female-1.png"),
      BannerModel(
      "Lorem ipsum",
      [
      ],
      "assets/female-2.png"),
  BannerModel(
      "",
      [
      ],
      "assets/female-5.png"),
      BannerModel(
      "",
      [
      ],
      "assets/female-3.png"),
];
