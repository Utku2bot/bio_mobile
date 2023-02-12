import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePageHexagonWidget extends StatelessWidget {
  const HomePageHexagonWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.onTap,
    required this.text



  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonalClipper(),
      child:InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.teal,
            boxShadow: [
              BoxShadow(
                  color: Color(0xffA22447).withOpacity(.05),
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 3)
            ]
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.add,color: Colors.white,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text,style:  TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
