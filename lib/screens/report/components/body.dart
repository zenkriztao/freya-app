import 'package:flutter/material.dart';

class Body extends StatelessWidget {
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
              top: 73,
              left: 83,
              child: Text(
                'Emergency Report',
                textAlign: TextAlign.left,
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
              top: 713,
              left: 32,
              child: Container(
                  width: 322,
                  height: 62,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 322,
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
                        left: 96.5999755859375,
                        child: Text(
                          'Report',
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
              top: 296,
              left: 32,
              child: Container(
                  width: 322,
                  height: 397,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 322,
                            height: 397,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(255, 5, 5, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: Color.fromRGBO(227, 89, 112, 1),
                                width: 2,
                              ),
                            ))),
                    Positioned(
                        top: 17,
                        left: 22,
                        child: Text(
                          'Do you have any symptoms that vary widely and can affect mood, thinking, and ability to interact with others?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(200, 200, 200, 1),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 355,
                        left: 238,
                        child: Text(
                          '20/100',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(211, 211, 211, 1),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
          Positioned(
              top: 214,
              left: 34,
              child: Container(
                  width: 318,
                  height: 62,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 318,
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
                        top: 20,
                        left: 20,
                        child: Text(
                          'Phone Number',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(211, 211, 211, 1),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
          Positioned(
              top: 132,
              left: 34,
              child: Container(
                  width: 318,
                  height: 62,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 318,
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
                        top: 20,
                        left: 20,
                        child: Text(
                          'Name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(211, 211, 211, 1),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
        ]));
  }
}
