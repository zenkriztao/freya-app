import 'package:flutter/material.dart';
import 'package:freya/routes.dart';
import 'package:freya/screens/report/report_screen.dart';
import 'package:freya/screens/sign_in/sign_in_screen.dart';
import 'package:freya/screens/splash/splash_screen.dart';
import 'package:freya/screens/report/report_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freya',
      initialRoute: ReportScreen.routeName,
      routes: routes,
    );
  }
}
