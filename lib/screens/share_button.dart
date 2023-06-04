import 'package:flutter/material.dart';
import 'package:freya/constant/size_config.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(100),
      height: getScreenHeight(40),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          primary: Colors.grey,
          backgroundColor: Color.fromARGB(255, 131, 36, 36),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
              fontSize: getScreenWidth(18), 
              color: Colors.white, 
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
