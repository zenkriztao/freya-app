import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'blog_page.dart';
import 'section_title.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getScreenWidth(30)),
            BlogPage(),
            SizedBox(height: getScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
