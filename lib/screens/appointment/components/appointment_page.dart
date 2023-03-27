import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator AppointmentPage - FRAME

    return Container(
        width: 390,
        height: 844,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 251, 251, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 168,
              left: -394,
              child: Container(
                  width: 311,
                  height: 311,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(167.5),
                      topRight: Radius.circular(167.5),
                      bottomLeft: Radius.circular(167.5),
                      bottomRight: Radius.circular(167.5),
                    ),
                    color: Color.fromRGBO(246, 246, 246, 1),
                  ))),
          Positioned(
              top: 168,
              left: -394,
              child: //Mask holder Template
                  Container(width: 311, height: 311, child: null)),
          Positioned(
              top: 76,
              left: 83,
              child: Text(
                'List Appointment ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(227, 89, 112, 1),
                    fontFamily: 'Inter',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 713,
              left: 35,
              child: Container(
                  width: 322,
                  height: 71,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 14,
                        left: 106,
                        child: Text(
                          'Report',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: 32,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 322,
                            height: 71,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(255, 5, 5, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              color: Color.fromRGBO(227, 89, 112, 1),
                            ))),
                  ]))),
          Positioned(
              top: 77,
              left: 21,
              child: SvgPicture.asset('assets/icons/love-icons.svg',
                  semanticsLabel: 'vector')),
          Positioned(
              top: 163,
              left: 30,
              child: Container(
                  width: 329,
                  height: 454,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 102,
                        left: 4,
                        child: Container(
                            width: 322,
                            height: 216,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 329,
                            height: 454,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0.000028150136131444015,
                                  left: 4,
                                  child: Container(
                                      width: 322,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ))),
                              Positioned(
                                  top: 50.00002670288086,
                                  left: 4,
                                  child: Container(
                                      width: 322,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(245, 245, 245, 1),
                                      ))),
                              Positioned(
                                  top: 318,
                                  left: 4,
                                  child: Container(
                                      width: 322,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ))),
                              Positioned(
                                  top: 334,
                                  left: 132,
                                  child: Text(
                                    '12/02/2023 - 10 AM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(73, 73, 73, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 18,
                                  left: 136,
                                  child: Text(
                                    '09/03/2023 - 8 AM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(73, 73, 73, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 367,
                                  left: 4,
                                  child: Container(
                                      width: 322,
                                      height: 51,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(245, 245, 245, 1),
                                      ))),
                              Positioned(
                                  top: 385,
                                  left: 179,
                                  child: Text(
                                    'Accepted',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(76, 154, 171, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 0.000028150136131444015,
                                  left: 4,
                                  child: Transform.rotate(
                                    angle: 0.000005008956538086317 *
                                        (math.pi / 180),
                                    child: SvgPicture.asset(
                                        'assets/icons/arrow-icon.svg',
                                        semanticsLabel: 'vector8'),
                                  )),
                              Positioned(
                                  top: 385,
                                  left: 20,
                                  child: Text(
                                    'Saraswati Domes',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(73, 73, 73, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 102.00003051757812,
                                  left: 4,
                                  child: Container(
                                      width: 322,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ))),
                              Positioned(
                                  top: 118,
                                  left: 18,
                                  child: Text(
                                    'Abuis Likasi',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(73, 73, 73, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 168,
                                  left: 20,
                                  child: Container(
                                      width: 296,
                                      height: 18,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 159,
                                            child: Text(
                                              '16/02/2023 - 9 AM',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      73, 73, 73, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 15,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 1,
                                            left: 0,
                                            child: Text(
                                              'Consultation Date ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      73, 73, 73, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                      ]))),
                              Positioned(
                                  top: 210,
                                  left: 87,
                                  child: Text(
                                    'Appointment Request ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(73, 73, 73, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 334,
                                  left: 18,
                                  child: Text(
                                    'Latika Sari',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(73, 73, 73, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                              Positioned(
                                  top: 101.00003051757812,
                                  left: 4,
                                  child: Transform.rotate(
                                    angle: -0.000005008956130975318 *
                                        (math.pi / 180),
                                    child: SvgPicture.asset(
                                        'assets/icons/arrow-icon.svg',
                                        semanticsLabel: 'vector10'),
                                  )),
                              Positioned(
                                  top: 367,
                                  left: 4,
                                  child: Transform.rotate(
                                    angle: -0.000005008956130975318 *
                                        (math.pi / 180),
                                    child: SvgPicture.asset(
                                        'assets/icons/arrow-icon.svg',
                                        semanticsLabel: 'vector12'),
                                  )),
                              Positioned(
                                  top: 50.00002670288086,
                                  left: 4,
                                  child: SvgPicture.asset(
                                      'assets/icons/arrow-icon.svg',
                                      semanticsLabel: 'vector9')),
                              Positioned(
                                  top: 436,
                                  left: 0,
                                  child: Container(
                                      width: 329,
                                      height: 18,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 85,
                                            child: Text(
                                              'No more appointment',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      201, 201, 201, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 15,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            )),
                                        Positioned(
                                            top: 10,
                                            left: 0,
                                            child: Transform.rotate(
                                              angle: 8.419782227722464e-22 *
                                                  (math.pi / 180),
                                              child: SvgPicture.asset(
                                                  'assets/icons/arrow-icon.svg',
                                                  semanticsLabel: 'vector14'),
                                            )),
                                        Positioned(
                                            top: 10,
                                            left: 251,
                                            child: Transform.rotate(
                                              angle: 8.419782227722464e-22 *
                                                  (math.pi / 180),
                                              child: SvgPicture.asset(
                                                  'assets/icons/arrow-icon.svg',
                                                  semanticsLabel: 'vector15'),
                                            )),
                                      ]))),
                              Positioned(
                                  top: 418,
                                  left: 4,
                                  child: Transform.rotate(
                                    angle: 0.000005008956538086317 *
                                        (math.pi / 180),
                                    child: SvgPicture.asset(
                                       'assets/icons/arrow-icon.svg',
                                        semanticsLabel: 'vector13'),
                                  )),
                              Positioned(
                                  top: 135.06396484375,
                                  left: 309,
                                  child: Transform.rotate(
                                    angle: 179.99999499104388 * (math.pi / 180),
                                    child: SvgPicture.asset(
                                        'assets/icons/arrow-icon.svg',
                                        semanticsLabel: 'vector'),
                                  )),
                              Positioned(
                                  top: 68,
                                  left: 179,
                                  child: Text(
                                    'Accepted',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(76, 154, 171, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
                    Positioned(
                        top: 318,
                        left: 2,
                        child: Transform.rotate(
                          angle: -0.000005008956130975318 * (math.pi / 180),
                          child: SvgPicture.asset('assets/icons/arrow-icon.svg',
                              semanticsLabel: 'vector11'),
                        )),
                    Positioned(
                        top: 18,
                        left: 18,
                        child: Text(
                          'Nafidza',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(73, 73, 73, 1),
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 20,
                        left: 284,
                        child: SvgPicture.asset('assets/icons/arrow-icon.svg',
                            semanticsLabel: 'vector')),
                    Positioned(
                        top: 336,
                        left: 284,
                        child: SvgPicture.asset('assets/icons/arrow-icon.svg',
                            semanticsLabel: 'vector')),
                    Positioned(
                        top: 68,
                        left: 18,
                        child: Text(
                          'Sarah Mintas',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(73, 73, 73, 1),
                              fontFamily: 'Inter',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 69,
                        left: 284,
                        child: SvgPicture.asset('assets/icons/arrow-icon.svg',
                            semanticsLabel: 'vector')),
                    Positioned(
                        top: 387,
                        left: 284,
                        child: SvgPicture.asset('assets/icons/arrow-icon.svg',
                            semanticsLabel: 'vector')),
                    Positioned(
                        top: 243,
                        left: 93,
                        child: Container(
                            width: 150,
                            height: 45,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 4.547473508864641e-13,
                                  left: 105,
                                  child: SvgPicture.asset(
                                      'assets/icons/arrow-icon.svg',
                                      semanticsLabel: 'vector')),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: SvgPicture.asset(
                                      'assets/icons/arrow-icon.svg',
                                      semanticsLabel: 'vector')),
                            ]))),
                  ]))),
        ]));
  }
}
