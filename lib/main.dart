import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freya/globals.dart';
import 'package:freya/screens/doctor/main_page_doctor.dart';
import 'package:freya/screens/doctor_or_patient.dart';
import 'package:freya/screens/firebase_auth.dart';
import 'package:freya/screens/my_profile.dart';
import 'package:freya/screens/onboarding/onboarding.dart';
import 'package:freya/screens/patient/appointments.dart';
import 'package:freya/screens/patient/doctor_profile.dart';
import 'package:freya/screens/patient/main_page_patient.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    _getUser();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => user == null ? OnboardingScreen() : const DoctorOrPatient(),
        '/login': (context) => const FireBaseAuth(),
        '/home': (context) =>
            isDoctor ? const MainPageDoctor() : const MainPagePatient(),
        '/profile': (context) => const MyProfile(),
        '/MyAppointments': (context) => const Appointments(),
        '/DoctorProfile': (context) => DoctorProfile(),
      },
      theme: ThemeData(fontFamily: "Nunito", brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
    );
  }
}
