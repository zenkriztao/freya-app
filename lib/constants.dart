import 'package:flutter/material.dart';
import 'package:freya/size_config.dart';

const primaryColor = Color.fromARGB(255, 0, 0, 0);
const secondaryColor = Color(0xE35970);
const thirdColor = Color(0xFF9090);
const animationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please Enter your email";
const String invalidEmailError = "Please Enter Valid Email";
const String passNullError = "Please Enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords don't match";
const String nameNullError = "Please Enter your name";

