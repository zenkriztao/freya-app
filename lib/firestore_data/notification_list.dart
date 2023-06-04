import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            splashRadius: 20,
            icon: const Icon(
              Iconsax.arrow_left,
              color: Color(0xFFE35970),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Notifications',
          style: GoogleFonts.nunito(
            color: Color(0xFFE35970),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
