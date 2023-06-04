import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:freya/model/banner_model.dart';

class Carouselslider extends StatelessWidget {
  const Carouselslider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        itemCount: bannerCards.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            height: 140,
            margin: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
            padding: const EdgeInsets.only(left: 0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      bannerCards[index].image,
                      //'assets/414.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 7, right: 5),
                    alignment: Alignment.topRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ),
                ],
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollPhysics: const ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
