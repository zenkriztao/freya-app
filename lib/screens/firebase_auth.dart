import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'register.dart';
import 'sign_in.dart';

class FireBaseAuth extends StatefulWidget {
  const FireBaseAuth({Key? key}) : super(key: key);

  @override
  State<FireBaseAuth> createState() => _FireBaseAuthState();

  // void out2(BuildContext context) {
  //   Navigator.pop(context);
  // }
}

class _FireBaseAuthState extends State<FireBaseAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/image-medical.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 80.0, left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 165,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () =>
                                  _pushPage(context, const SignIn()),
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                primary: Color(0xFFE35970),
                                onPrimary: Color(0xFFE35970),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              child: Text(
                                "Log in",
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () =>
                                  _pushPage(context, const Register()),
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                primary: Colors.white,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  side: BorderSide(color: Color(0xFFE35970), width: 1)
                                ),
                              ),
                              child: Text(
                                "Create an Account",
                                style: GoogleFonts.nunito(
                                  color: const Color.fromARGB(255, 83, 82, 82),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ), //<--
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
