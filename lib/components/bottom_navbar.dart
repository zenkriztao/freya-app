import 'package:flutter/material.dart';
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
    final Color inActiveIconColor = Color.fromARGB(255, 158, 140, 140);
    final TextStyle textStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0);
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/home.png",
                    width: 24,
                    height: 24,
                    color: MenuState.home == selectedMenu
                        ? Color.fromARGB(255, 156, 32, 23)
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, HomeScreen.routeName),
                ),
                Text(
                  'Home',
                  style: textStyle.copyWith(
                    color: MenuState.home == selectedMenu
                        ? Color.fromARGB(255, 156, 32, 23)
                        : inActiveIconColor,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    width: 24,
                    height: 24,
                    "assets/icons/mail.png",
                    color: MenuState.favourite == selectedMenu
                        ? Color.fromARGB(255, 156, 32, 23)
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, TweetScreen.routeName),
                ),
                Text(
                  'Tweet',
                  style: textStyle.copyWith(
                    color: MenuState.favourite == selectedMenu
                        ? Color.fromARGB(255, 156, 32, 23)
                        : inActiveIconColor,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/chat.png",
                    width: 24,
                    height: 24,
                    color: MenuState.message == selectedMenu
                        ? Color.fromARGB(255, 156, 32, 23)
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, AppointmentList.routeName),
                ),
                Text(
                  'Appointment',
                  style: textStyle.copyWith(
                    color: MenuState.message == selectedMenu
                        ? Color.fromARGB(255, 156, 32, 23)
                        : inActiveIconColor,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/user.png",
                    width: 24,
                    height: 24,
                    color: MenuState.profile == selectedMenu
                        ? Color.fromARGB(255, 156, 32, 23)
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, AccountScreen.routeName),
                ),
                Text(
                  'Profile',
                  style: textStyle.copyWith(
                    color: MenuState.profile == selectedMenu
                        ? Color.fromARGB(255, 156, 32, 23)
                        : inActiveIconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
