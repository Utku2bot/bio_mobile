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
            SizedBox(
              width: Dimensions.width200/2,
              height:  Dimensions.height200/2,
              child: Image.asset(
                "assets/audio_image.png",
                scale: 2,
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
            "assets/audio_char.png",
            scale: 1,
          ),
        ),
      ),
    );
  }
}
