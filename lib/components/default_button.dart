import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(250),
      height: getScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(color: Colors.grey)),
          primary: Colors.grey,
          backgroundColor: Colors.white,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
              fontSize: getScreenWidth(18), 
              color: Colors.grey, 
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
