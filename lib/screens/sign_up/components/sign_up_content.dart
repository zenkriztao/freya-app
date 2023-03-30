import 'package:flutter/material.dart';
import 'package:freya/helper/keyboard.dart';
import 'package:freya/screens/home/home_screen.dart';
import 'package:freya/components/loginCard.dart';
import 'package:http/http.dart' as http;

import '../../../api/api_endpoint.dart';
import '../../../components/sign_button.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/sign_in_screen.dart';
import '../../user.dart';

class SignUpContent extends StatefulWidget {
  @override
  _SignUpContentState createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
  final _globalKey = GlobalKey<FormState>();
  final _apiHelper = ApiHelper();
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

  Future save() async {
    var res = await http.post("http://localhost:5000/signup" as Uri,
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });
    print(res.body);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  User user = User('', '');

  // void _handleRegister () async {
  //   if (_globalKey.currentState!.validate()) {
  //     _globalKey.currentState!.save();
  //     try {
  //       final response = await _apiHelper.register(email!, password!);
  //       if (response['success']) {
  //         Navigator.pushNamed(context, SignInScreen.routeName);
  //       } else {
  //         addError(error: response['message']);
  //       }
  //     } catch (e) {
  //       addError(error: e.toString());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          SizedBox(height: getScreenHeight(30)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                child: Text(
                  "First Name",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: getScreenWidth(15),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(10)),
          buildEmailFormField(),
          SizedBox(height: getScreenHeight(10)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                child: Text(
                  "Last Name",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: getScreenWidth(15),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(10)),
          buildEmailFormField(),
          SizedBox(height: getScreenHeight(10)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                child: Text(
                  "Email",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: getScreenWidth(15),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(10)),
          buildEmailFormField(),
          SizedBox(height: getScreenHeight(10)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                child: Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: getScreenWidth(15),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(10)),
          buildPasswordFormField(),
          SizedBox(height: getScreenHeight(10)),
          Row(
            children: [
              SizedBox(height: getScreenHeight(10)),
            ],
          ),
          SignButton(
            text: "Sign up",
            press: () {
              // _handleRegister();
              if (_globalKey.currentState!.validate()) {
                save();
                KeyboardUtil.hideKeyboard(context);
              }
            },
          ),
          SizedBox(height: getScreenHeight(10)),
          SizedBox(height: getScreenHeight(20)),
          SizedBox(height: getScreenHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account yet?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getScreenWidth(16),
                    fontWeight: FontWeight.bold,
                  )),
              GestureDetector(
                onTap: () {
                  // Navigasi ke halaman baru
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text(
                  " Sign In",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 184, 78, 78),
                    fontSize: getScreenWidth(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
        hintText: "Enter password..",
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
        hintText: "",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(31),
        ),
      ),
    );
  }
}
