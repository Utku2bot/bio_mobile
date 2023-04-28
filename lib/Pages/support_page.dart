import 'package:biocoder/Widgets/elevated_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';
import '../Utils/dimensions.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bioGreen,
        title: Text("yardım".tr),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ElevatedContainer(elevation: 10, height: Dimensions.height200/2, width: Dimensions.width200, color: bioGreen, text: "eğtimvideoları".tr, fontSize: 20),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: Dimensions.padHeight30),
                child: ElevatedContainer(elevation: 10, height: Dimensions.height200/2, width: Dimensions.width200, color: bioGreen, text: "uygulamanedir".tr, fontSize: 20),
              ),
              ElevatedContainer(elevation: 10, height: Dimensions.height200/2, width: Dimensions.width200, color: bioGreen, text: "tanıtım".tr, fontSize: 20),

            ],
          ),
        ),
      ),
    );
  }
}

