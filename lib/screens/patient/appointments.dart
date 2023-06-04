import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/firestore_data/appointment_list.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFE35970),
        title: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'My Appointments',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
        child: const AppointmentList(),
      ),
    );
  }
}
