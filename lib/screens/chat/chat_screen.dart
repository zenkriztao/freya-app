import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';
import 'package:freya/screens/chat/components/body.dart';

class ChatScreen extends StatelessWidget {
  static String routeName = "/chat";
  @override 
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}