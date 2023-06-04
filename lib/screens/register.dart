import 'dart:math';
import 'package:freya/constant/size_config.dart';
import 'package:freya/globals.dart' as globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/screens/sign_in.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  int type = -1;

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (BuildContext context) {
        return Container(
              color: Color(0xFFE35970),
              child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                     SizedBox(height: SizeConfig.screenHeight * 0.08),
                    Text(
                      "Sign Up",
                      style: GoogleFonts.nunito(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: getScreenWidth(32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: SizeConfig.screenHeight * 0.05),
                    Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: _signUp(),
                        ),
                        SizedBox(height: getScreenHeight(24)),
                      ],
                    ),
                  ],
                )
            ]),
              )),
      );
      }),
    );
  }

  Widget _signUp() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            // display name
            TextFormField(
              focusNode: f1,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _displayName,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Full Name',
                hintStyle: GoogleFonts.nunito(
                  color: Colors.black26,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              onFieldSubmitted: (value) {
                f1.unfocus();
                FocusScope.of(context).requestFocus(f2);
              },
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) return 'Please enter the Name';
                return null;
              },
            ),
            const SizedBox(
              height: 25.0,
            ),

            // email
            TextFormField(
              focusNode: f2,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email Address',
                hintStyle: GoogleFonts.nunito(
                  color: Colors.black26,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              onFieldSubmitted: (value) {
                f2.unfocus();
                if (_passwordController.text.isEmpty) {
                  FocusScope.of(context).requestFocus(f3);
                }
              },
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the Email';
                } else if (!emailValidate(value)) {
                  return 'Please enter correct Email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 25.0,
            ),

            // password
            TextFormField(
              focusNode: f3,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              //keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                hintStyle: GoogleFonts.nunito(
                  color: Colors.black26,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              onFieldSubmitted: (value) {
                f3.unfocus();
                if (_passwordConfirmController.text.isEmpty) {
                  FocusScope.of(context).requestFocus(f4);
                }
              },
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the Password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                } else {
                  return null;
                }
              },
              obscureText: true,
            ),
            const SizedBox(
              height: 25.0,
            ),

            // confirm password
            TextFormField(
              focusNode: f4,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              controller: _passwordConfirmController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Confirm Password',
                hintStyle: GoogleFonts.nunito(
                  color: Colors.black26,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              onFieldSubmitted: (value) {
                f4.unfocus();
              },
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the Password';
                } else if (value.compareTo(_passwordController.text) != 0) {
                  return 'Password not Matching';
                } else {
                  return null;
                }
              },
              obscureText: true,
            ),

            const SizedBox(
              height: 20,
            ),
            Text("Are you a User or a Psychologists?",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    color: Color(0xFFE35970),
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),

            const SizedBox(height: 30),
            // type of account
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        type = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: Color.fromARGB(255, 218, 116, 133),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        side: BorderSide(
                          width: 8.0,
                          color: Colors.white,
                          style:
                              type == 0 ? BorderStyle.solid : BorderStyle.none,
                        )),
                    child: Text(
                      "Pyschologist",
                      style: GoogleFonts.lato(
                        color: type == 0 ? Colors.black : Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      '||||||',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        type = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      primary: Color.fromARGB(255, 218, 116, 133),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      side: BorderSide(
                        style: type == 1 ? BorderStyle.solid : BorderStyle.none,
                        width: 8,
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      "User",
                      style: GoogleFonts.lato(
                        color: type == 1 ? Colors.black : Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: const Divider(
                thickness: 1.5,
              ),
            ),

            // signin button
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() && type != -1) {
                      showLoaderDialog(context);
                      _registerAccount();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    primary: Color(0xFFE35970),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // signin page option
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.nunito(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () => _pushPage(context, const SignIn()),
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Color(0xFFE35970),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Navigator.pop(context);
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pop(context);
        FocusScope.of(context).requestFocus(f2);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Error!",
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "Email already Exists",
        style: GoogleFonts.nunito(),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 15),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool emailValidate(String email) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  void _registerAccount() async {
    User? user;
    UserCredential? credential;

    try {
      credential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (error) {
      if (error.toString().compareTo(
              '[firebase_auth/email-already-in-use] The email address is already in use by another account.') ==
          0) {
        showAlertDialog(context);
      }
      print(error.toString());
    }
    user = credential!.user;

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateDisplayName(_displayName.text);

      String name =
          (type == 0) ? 'Dr. ${_displayName.text}' : _displayName.text;
      String accountType = (type == 0) ? 'doctor' : 'patient';
      FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': name,
        'type': accountType,
        'email': user.email,
      }, SetOptions(merge: true));

      // set data according to type (doctor or patient)
      Map<String, dynamic> mp = {
        'id': user.uid,
        'type': accountType,
        'name': name,
        'birthDate': null,
        'email': user.email,
        'phone': null,
        'bio': null,
        'address': null,
        'profilePhoto': null,
      };
      // if doctor
      if (type == 0) {
        mp.addAll({
          'openHour': "09:00",
          'closeHour': "21:00",
          'rating': double.parse(
              (3 + Random().nextDouble() * 1.9).toStringAsPrecision(2)),
          'specification': null,
          'specialization': 'general',
        });
        globals.isDoctor = true;
      }

      // sep
      FirebaseFirestore.instance.collection(accountType).doc(user.uid).set(mp);

      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    } else {}
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
