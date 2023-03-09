import 'package:flutter/material.dart';


class WidgetTextField extends StatelessWidget {
   WidgetTextField({
    required this.textLabel,required this.icon,required this.obscure,required this.colorHint,required this.colorBorder, required this.colorLabel,
    Key? key, required this.controller,
  }) : super(key: key);
  String textLabel;
  Widget icon;
  final controller;
  bool obscure;
  Color colorHint;
   Color colorLabel;
   Color colorBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextField(
        textAlign: TextAlign.center,

        style: Theme.of(context).textTheme.labelMedium,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintStyle:  TextStyle(color: colorHint,fontSize: 18,fontWeight: FontWeight.w500),
          labelStyle: TextStyle(color: colorLabel,fontSize: 12,fontWeight: FontWeight.w500),
          filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: icon,
            labelText: textLabel,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: colorBorder,
                  width: 3,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: colorBorder,
                  width: 3,
                )
            ),
          )
      ),
    );
  }
}
