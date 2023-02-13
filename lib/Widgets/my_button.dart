import 'package:flutter/material.dart';



class MyButton extends StatelessWidget {
   MyButton({required this.color,required this.text,required this.width,required this.height,
    Key? key, this.onTap,
  }) : super(key: key);
  Color color;
  String text;
  final onTap;
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius:const BorderRadius.all(Radius.elliptical(20,40)),
        ),
        child: Center(child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500) ,),),
      ),);
  }
}