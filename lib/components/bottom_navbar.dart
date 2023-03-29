import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freya/screens/chat/chat_screen.dart';
import 'package:freya/screens/home/home_screen.dart';
import 'package:freya/screens/blog/blog_screen.dart';
import 'package:freya/screens/report/report_screen.dart';
import 'package:freya/screens/account/account_screen.dart'; 
import 'package:freya/screens/tweet/tweet_screen.dart';
import 'package:freya/screens/appointment/appointment_list.dart';
import '../enums.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/menu_icon.svg",
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, BlogScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/sms_icon.svg"),
                onPressed: () =>
                    Navigator.pushNamed(context, TweetScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/home_icon.svg"),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/chat_icon.svg"),
                onPressed: () =>
                    Navigator.pushNamed(context, AppointmentList.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/profile_icon.svg",
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, AccountScreen.routeName),
              ),
            ],
          )),
    );
  }
}
