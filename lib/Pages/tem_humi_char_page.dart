import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/dimensions.dart';

class TempHumiCharPage extends StatefulWidget {
  const TempHumiCharPage({Key? key}) : super(key: key);

  @override
  _TempHumiCharPageState createState() => _TempHumiCharPageState();
}

class _TempHumiCharPageState extends State<TempHumiCharPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bioGreen,
        elevation: 0,
        title: Text("sıcaklıkvenemgrafikleri".tr),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.padHeight10,
              horizontal: Dimensions.padWidth10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  "sıcaklıkgrafiği".tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Material(
                  elevation: 5,
                  child: Image.asset(
                    "assets/temperature_char.png",
                    scale: 1,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "nemgrafiği".tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Material(
                  elevation: 5,
                  child: Image.asset(
                    "assets/humidity_char.png",
                    scale: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
