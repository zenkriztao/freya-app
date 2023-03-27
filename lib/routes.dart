import 'package:flutter/widgets.dart';
import 'package:freya/screens/option_user/option_screen.dart';
import 'package:freya/screens/splash/splash_screen.dart';
import 'package:freya/screens/sign_in/sign_in_screen.dart';
import 'package:freya/screens/sign_up/sign_up_screen.dart';
import 'package:freya/screens/home/home_screen.dart';
import 'package:freya/screens/blog/blog_screen.dart';
import 'package:freya/screens/report/report_screen.dart';
import 'package:freya/screens/chat/chat_screen.dart';
import 'package:freya/screens/account/account_screen.dart';
import 'package:freya/screens/forgot/forgot_screen.dart';
import 'package:freya/screens/curhat/curhat_screen.dart';
import 'package:freya/screens/splas/splas_screen.dart';
import 'package:freya/screens/counselor/counselor_screen.dart';
import 'package:freya/screens/tweet/tweet_screen.dart';
import 'package:freya/screens/blog/blog_page_screen.dart';
import 'package:freya/screens/appointment/appointment_screen.dart';
import 'package:freya/screens/appointment/appointment_list.dart';
import 'package:freya/screens/forgot/forgot_email.dart';


// routes are used to navigate between screens
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  BlogScreen.routeName: (context) => BlogScreen(),
  CurhatScreen.routeName: (context) => CurhatScreen(),
  ReportScreen.routeName: (context) => ReportScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  OptionScreen.routeName: (context) => OptionScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
  SplasScreen.routeName: (context) => SplasScreen(),
  CounselorScreen.routeName: (context) => CounselorScreen(),
  TweetScreen.routeName: (context) => TweetScreen(),
  BlogScreenPage.routeName: (context) => BlogScreenPage(),
  AppointmentScreen.routeName: (context) => AppointmentScreen(),
  AppointmentList.routeName: (context) => AppointmentList(),
  ForgotScreen.routeName: (context) => ForgotScreen(),
  ForgotEmail.routeName: (context) => ForgotEmail(),
};
