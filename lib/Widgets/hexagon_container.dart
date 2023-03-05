import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';



class HexagonContainer extends StatelessWidget {

  final Color color;
  final String text;
  final  onTap;
  final String image;
  final double scale;

   const HexagonContainer({
    super.key,
    required this.color,
    required this.text
    ,required this.onTap,
     required this.image,
     required this.scale
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipPolygon(
            sides: 6,
            borderRadius: 5.0,
            rotate: 90,
            boxShadows: [
              PolygonBoxShadow(color: color, elevation: 10.0),
            ],
            child: Container(color: color),
          ),
          SizedBox(
            height: 115,
            width: 115,
            child: ClipPolygon(
              sides: 6,
              borderRadius: 5.0,
              rotate: 90,
              boxShadows: [
                PolygonBoxShadow(color: Colors.white, elevation: 5.0),
              ],

              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [Color(0xffa2a2a2), Color(0xff000000)],
                      center: Alignment.center,
                      radius: 0.8,
                    )),
                child: ElevatedButton(
                  onPressed: onTap
                  ,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset(
                    "assets/$image.png",
                    scale: scale,
                  )
                    ,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        text,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],)

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
