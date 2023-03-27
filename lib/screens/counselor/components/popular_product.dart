import 'package:flutter/material.dart';
import 'package:freya/components/counselor_card.dart';
import 'package:freya/models/Dokter.dart';
import '../../../size_config.dart';
import 'package:freya/screens/report/report_screen.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getScreenWidth(20)),
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...List.generate(
                    demoDokters.length,
                    (index) {
                      if (demoDokters[index].isPopular)
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportScreen(),
                              ),
                            );
                          },
                          child: CounselorCard(dokter: demoDokters[index]),
                        );
                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getScreenWidth(20)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
