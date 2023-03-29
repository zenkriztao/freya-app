import 'package:flutter/material.dart';
import 'package:freya/screens/blog/blog_page_screen.dart';
import '../../../size_config.dart';
import 'blog_page.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: getScreenWidth(18),
              color: Color.fromARGB(255, 218, 84, 84),
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () => {
            // Navigasi ke halaman baru
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BlogScreenPage()),
            ),
          },
          child: Text(
            "View all",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
