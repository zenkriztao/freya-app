import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freya/constant/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freya/globals.dart';
import 'package:freya/helperFunction/sharedpref_helper.dart';
import 'package:freya/screens/register.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Builder(builder: (BuildContext context) {
          return Container(
              color: Color.fromARGB(255, 135, 43, 43),
              child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Image.asset(
                      "assets/logo.png",
                      height: getScreenHeight(100),
                      width: getScreenWidth(300),
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: getScreenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                    Stack(children: [
                      Stack(children: <Widget>[
                        Expanded( child: SizedBox(
                          child: withEmailPassword(),
                      )),
                      ])
                    ])
                  ]))));
        }));
  }

  Widget withEmailPassword() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                'Log In',
                style: GoogleFonts.nunito(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // email
            TextFormField(
              focusNode: f1,
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
                f1.unfocus();
                FocusScope.of(context).requestFocus(f2);
              },
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the Email Address';
                } else if (!emailValidate(value)) {
                  return 'Please enter correct Email Address';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 25.0,
            ),

            // password
            TextFormField(
              focusNode: f2,
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
                f2.unfocus();
                FocusScope.of(context).requestFocus(f3);
              },
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) return 'Please enter the Password';
                return null;
              },
              obscureText: true,
            ),
            // sign in button
            Container(
              padding: const EdgeInsets.only(top: 25.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  focusNode: f3,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showLoaderDialog(context);
                      _signInWithEmailAndPassword();
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
                    "Log In",
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // forget password
            Container(
              padding: const EdgeInsets.only(top: 15, left: 180),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // dont have account
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet?",
                    style: GoogleFonts.nunito(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () => _pushPage(context, const Register()),
                    child: Text(
                      'Sign up here',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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

  void _signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
      }

      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      var basicInfo = snap.data() as Map<String, dynamic>;

      isDoctor = basicInfo['type'] == 'doctor' ? true : false;

      // save data to local storage
      SharedPreferenceHelper().saveUserId(user.uid);
      // SharedPreferenceHelper().saveProfileUrl(user);
      SharedPreferenceHelper().saveUserName(basicInfo['name']);
      SharedPreferenceHelper()
          .saveAccountType(basicInfo['type'] == 'doctor' ? true : false);

      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    } catch (e) {
      final snackBar = SnackBar(
        content: Row(
          children: const [
            Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            Text(" There was a problem signing you in"),
          ],
        ),
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
