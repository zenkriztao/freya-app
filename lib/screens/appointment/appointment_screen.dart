import 'package:flutter/material.dart';
import 'package:freya/screens/appointment/components/appointment_page.dart';
import 'package:freya/size_config.dart';
import 'package:freya/components/bottom_navbar.dart';
import 'package:freya/enums.dart';

class AppointmentScreen extends StatelessWidget {
    static String routeName = "/appointment";
    @override
    Widget build(BuildContext context) {
        SizeConfig().init(context);
        return Scaffold(
            body: AppointmentPage(),
            bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
        );
    }
}