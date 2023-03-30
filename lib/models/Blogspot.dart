import 'package:flutter/material.dart';

class Blogspot {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final bool isPopular;

  Blogspot({
    required this.id,
    required this.images,
    required this.colors,
    this.isPopular = false,
    required this.title,
    required this.description,
  });
}

// Our demo Blogspots

List<Blogspot> demoBlogspots = [
  Blogspot(
    id: 1,
    images: [
      "assets/images/blog_1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Women",
    description: description,
    isPopular: true,
  ),
  Blogspot(
    id: 2,
    images: [
      "assets/images/blog_2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "",
    description: description,
    isPopular: true,
  ),
  Blogspot(
    id: 3,
    images: [
      "assets/images/blog_3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "",
    description: description,
    isPopular: true,
  ),
  Blogspot(
    id: 4,
    images: [
      "assets/images/blog_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "",
    description: description,
    isPopular: true,
  ),
  Blogspot(
    id: 5,
    images: [
      "assets/images/blog_5.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "",
    description: description,
    isPopular: true,
  ),
  Blogspot(
    id: 6,
    images: [
      "assets/images/blog_6.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "",
    description: description,
    isPopular: true,
  ),
];

const String description =
    "…";
