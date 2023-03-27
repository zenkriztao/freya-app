import 'package:flutter/material.dart';
import 'package:freya/screens/appointment/components/body.dart';
import 'package:freya/size_config.dart';
import 'package:freya/components/bottom_navbar.dart';
import 'package:freya/enums.dart';

class AppointmentList extends StatelessWidget {
    static String routeName = "/appointment-list";
    @override
    Widget build(BuildContext context) {
        SizeConfig().init(context);
        return Scaffold(
            body: Body(),
            bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
        );
    }
}