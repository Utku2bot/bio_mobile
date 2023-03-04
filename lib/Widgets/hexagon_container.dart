import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

import '../Utils/colors.dart';

class HexagonContainer extends StatelessWidget {
  final double rotation;

  const HexagonContainer({
    super.key,
    required this.rotation,
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
            rotate: rotation,
            boxShadows: [
              PolygonBoxShadow(color: bioGreen, elevation: 10.0),
            ],
            child: Container(color: bioGreen),
          ),
          SizedBox(
            height: 110,
            width: 110,
            child: ClipPolygon(
              sides: 6,
              borderRadius: 5.0,
              rotate: rotation,
              boxShadows: [
                PolygonBoxShadow(color: bioGreen, elevation: 5.0),
              ],
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Color(0xff5f5f5f), Color(0xff002327)],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Ayarlar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
