import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:freya/routes.dart';
import 'package:freya/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Color.fromARGB(255, 135, 43, 43));
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    // status bar color in iOS and Android
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 135, 43, 43),
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      title: 'Freya',
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
