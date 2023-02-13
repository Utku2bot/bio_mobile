import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton({
    required this.text,
    Key? key,this.onPressed,
    required this.textStyle
  }) : super(key: key);
  String text;
  var onPressed;
  TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
         style: textStyle,
      ),
    );
  }
}