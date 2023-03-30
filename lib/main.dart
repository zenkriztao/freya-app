import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:freya/routes.dart';
import 'package:freya/screens/onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     // status bar color in iOS and Android
    // FlutterStatusbarcolor.setStatusBarColor(Color.fromARGB(255, 64, 23, 23));
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    // // status bar color in iOS and Android
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Color.fromARGB(255, 114, 19, 19),
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      title: 'Freya',
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
