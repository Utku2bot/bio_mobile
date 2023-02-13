import 'dart:math' as math;

import 'package:biocoder/Utils/colors.dart';
import 'package:flutter/material.dart';

class HexagonWidget extends StatelessWidget {
  const HexagonWidget(
      {Key? key,
      required this.size,
      required this.color,
      required this.onTap,
      required this.text,
      required this.offset})
      : super(key: key);
  final double size;
  final Color color;
  final onTap;
  final String text;
  final double offset;
  //Text(text,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //color: Colors.grey,
        width: 60,
        height: 60,
        child:
        CustomPaint(
          painter: HexagonPainter(Offset(offset, offset), size,color),
          child: Center(
            child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
          ),
        ),
            ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  static const int SIDES_OF_HEXAGON = 6;
  final double radius;
  final Offset center;
  Color color = bioBlue;

  HexagonPainter(this.center, this.radius,this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Path path = createHexagonPath();
    canvas.drawPath(path, paint);
  }

  Path createHexagonPath() {
    final path = Path();
    var angle = (math.pi * 2) / SIDES_OF_HEXAGON;
    Offset firstPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
    path.moveTo(firstPoint.dx + center.dx, firstPoint.dy + center.dy);
    for (int i = 1; i <= SIDES_OF_HEXAGON; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
