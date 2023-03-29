import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/screens/chat_user/components/body.dart';

class ChatUserScreen extends StatelessWidget {
  static String routeName = "/chat_user";
  @override 
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}