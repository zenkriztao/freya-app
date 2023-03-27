import 'package:flutter/material.dart';

class Dokter {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final bool isPopular;

  Dokter({
    required this.id,
    required this.images,
    required this.colors,
    this.isPopular = false,
    required this.title,
    required this.description,
  });
}

// Our demo Dokters

List<Dokter> demoDokters = [
  Dokter(
    id: 1,
    images: [
      "assets/images/dokter_1.png",
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
  Dokter(
    id: 2,
    images: [
      "assets/images/dokter_2.png",
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
  Dokter(
    id: 3,
    images: [
      "assets/images/dokter_3.png",
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
