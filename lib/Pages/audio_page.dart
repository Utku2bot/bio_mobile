import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/dimensions.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bioBlue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("home_ses".tr),
            Padding(
              padding:  EdgeInsets.only(top: Dimensions.padHeight10*1.5),
              child: Container(
                width: Dimensions.width200,
                height: Dimensions.height200,
                child:  Image.asset(
                  "assets/audio.png",
                  scale: 1,
                ),
              ),
            )

          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(Dimensions.padWidth10),
        child: Center(
          child:
          Image.asset(
            "assets/charaudio.png",
            scale: 1,
          ),
        ),
      ),
    );
  }
}
