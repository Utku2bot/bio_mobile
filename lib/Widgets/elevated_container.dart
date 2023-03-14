import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  final double elevation;
  final double height;
  final double width;
  final color;
  final text;
  final double fontSize;

  const ElevatedContainer({
    super.key,required this.elevation,required this.height,required this.width,required this.color,required this.text,required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child:  Center(child:  Text(text,style:  TextStyle(color: Colors.white,fontSize: fontSize,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}
