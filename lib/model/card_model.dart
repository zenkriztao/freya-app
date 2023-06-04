import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

class CardModel {
  String doctor;
  int cardBackground;
  var cardIcon;

  CardModel(this.doctor, this.cardBackground, this.cardIcon);
}

List<CardModel> cards = [
  CardModel("Don't Afraid Speak Up", 0xFFec407a, Icons.heart_broken),
  CardModel("Stress It Out", 0xFF5c6bc0, const IconData(0x1F9B7)),
  CardModel("Eating Disorder", 0xFFfbc02d, TablerIcons.eye),
  CardModel("BD Disorder", 0xFF1565C0, Icons.wheelchair_pickup_sharp),
  CardModel("Shy Shy Cat", 0xFF2E7D32, const IconData(0x1f476)),
];
