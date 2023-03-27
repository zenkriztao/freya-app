import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/screens/blog/components/blog_page.dart';
import 'package:freya/components/bottom_navbar.dart';
import 'package:freya/enums.dart';

class BlogScreenPage extends StatelessWidget {
  static String routeName = "/blog-page";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlogPage(),
    );
  }
}
