import 'package:flutter/material.dart';
import 'package:freya/routes.dart';
import 'package:freya/screens/home/home_screen.dart';
import 'package:freya/screens/blog/blog_screen.dart';
import 'package:freya/screens/report/report_screen.dart';
import 'package:freya/screens/sign_in/sign_in_screen.dart';
import 'package:freya/screens/sign_up/sign_up_screen.dart';
import 'package:freya/screens/onboarding/onboarding.dart';
import 'package:freya/screens/report/report_screen.dart';
import 'package:freya/screens/curhat/curhat_screen.dart'; 
import 'package:freya/screens/option_user/option_screen.dart'; 
import 'package:freya/screens/account/account_screen.dart'; 
import 'package:freya/screens/option_user/option_screen.dart'; 
import 'package:freya/screens/chat/chat_screen.dart'; 
import 'package:freya/screens/splash/splash_screen.dart';
import 'package:freya/screens/curhat_isi/curhat1_screen.dart';
import 'package:freya/screens/chat_user/chatuser_screen.dart';
import 'package:freya/screens/counselor/counselor_screen.dart';
import 'package:freya/screens/tweet/tweet_screen.dart';
import 'package:freya/screens/blog/blog_page_screen.dart';
import 'package:freya/screens/appointment/appointment_screen.dart';
import 'package:freya/screens/appointment/appointment_list.dart';
import 'package:freya/screens/forgot/forgot_screen.dart'; 
import 'package:freya/screens/forgot/forgot_email.dart'; 



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      title: 'Freya',
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
