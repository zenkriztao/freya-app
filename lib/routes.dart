import 'package:flutter/widgets.dart';
import 'package:freya/screens/splash/splash_screen.dart';
import 'package:freya/screens/sign_in/sign_in_screen.dart';
import 'package:freya/screens/home/home_screen.dart';

// routes are used to navigate between screens
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
