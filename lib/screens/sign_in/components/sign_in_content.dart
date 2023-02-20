import 'package:flutter/material.dart';
import 'package:freya/helper/keyboard.dart';
import 'package:freya/screens/home/home_screen.dart';
import 'package:freya/components/loginCard.dart';
import '../../../components/sign_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignInContent extends StatefulWidget {
  @override
  _SignInContentState createState() => _SignInContentState();
}

class _SignInContentState extends State<SignInContent> {
  final _globalKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override 
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          SizedBox(height: getScreenHeight(30)),
          Text(
            "Email Address",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: getScreenWidth(15),
              fontWeight: FontWeight.bold,
            ),
          ),
          buildEmailFormField(),
          SizedBox(height: getScreenHeight(30)),
          Text(
            "Password",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: getScreenWidth(15),
              fontWeight: FontWeight.bold,
            ),
          ),
          buildPasswordFormField(),
          SizedBox(height: getScreenHeight(30)),
          Row(
            children: [
              // Checkbox(
              //   value: remember,
              //   activeColor: primaryColor,
              //   onChanged: (value) {
              //     setState(() {
              //       remember = value;
              //     });
              //   },
              // ), // Checkbox
              // Text("Remember me"),
              // Spacer(
              // ),
              SizedBox(height: getScreenHeight(20)),
              SignButton(
                text: "Log in",
                press: () {
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                    Navigator.pushNamed(context, HomeScreen.routeName); 
                  }
                },
              ),
              SizedBox(height: getScreenHeight(100)),
              
              SizedBox(height: getScreenHeight(30)),
              Text(
                "Don't have an account yet?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getScreenWidth(16),
                  fontWeight: FontWeight.bold,
                )
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Color.fromARGB(255, 184, 78, 78),
                  fontSize: getScreenWidth(16),
                  fontWeight: FontWeight.bold,
                )
              )
            ],
          ),
        ],
      ),
    );
  }

    TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.length >= 8) {
          removeError(error: shortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: shortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "saveMe&1010",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(31),
      ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: invalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: invalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "loveSelf@me.com",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(31),
      ),
      ),
    );
  }
}

