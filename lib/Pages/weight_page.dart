import 'package:biocoder/Utils/dimensions.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bioGreen,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Weight"),
           SizedBox(
             width: Dimensions.width200,
             height: Dimensions.height200,
             child:  Image.asset(
               "assets/weight_image.png",
               scale: 2,
             ),
           )

          ],
        ),
              ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.padHeight10),
        child: Center(
          child:
          Image.asset(
            "assets/weight2.png",
            scale: 1,
          ),
        ),
      ),
    );
  }
}
