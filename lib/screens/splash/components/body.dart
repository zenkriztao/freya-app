import 'dart:async';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/splash');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 36, 36),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    MediaQuery.of(context).size.width / 0.1,
                  ),
                  topRight: Radius.circular(
                    MediaQuery.of(context).size.width / 0.1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4,
            child: Image.asset(
              'assets/images/splash.png',
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Text(
              'Lets Start',
              style: TextStyle(
                color: Color.fromARGB(255, 143, 27, 27),
                fontSize: 24,
                fontStyle: FontStyle.italic,
                backgroundColor: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
