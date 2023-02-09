import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 390,
        height: 844,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 390,
                  height: 838,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
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
              top: 266,
              left: 59,
              child: Text(
                'Are you a User or a Psychologists?',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(227, 89, 112, 1),
                    fontFamily: 'Inter',
                    fontSize: 32,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 400,
              left: 48,
              child: Container(
                  width: 280,
                  height: 62,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 280,
                            height: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(31),
                                topRight: Radius.circular(31),
                                bottomLeft: Radius.circular(31),
                                bottomRight: Radius.circular(31),
                              ),
                              color: Color.fromRGBO(227, 89, 112, 1),
                              border: Border.all(
                                color: Color.fromRGBO(217, 217, 217, 1),
                                width: 2,
                              ),
                            ))),
                    Positioned(
                        top: 17,
                        left: 84,
                        child: Text(
                          'User',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: 24,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
          Positioned(
              top: 510,
              left: 48,
              child: Container(
                  width: 280,
                  height: 62,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 280,
                            height: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(31),
                                topRight: Radius.circular(31),
                                bottomLeft: Radius.circular(31),
                                bottomRight: Radius.circular(31),
                              ),
                              color: Color.fromRGBO(227, 89, 112, 1),
                              border: Border.all(
                                color: Color.fromRGBO(227, 89, 112, 1),
                                width: 2,
                              ),
                            ))),
                    Positioned(
                        top: 17,
                        left: 27,
                        child: Text(
                          'Psychologists',
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
                  ]))),
        ]));
  }
}
