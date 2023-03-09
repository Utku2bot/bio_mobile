import 'package:biocoder/Utils/colors.dart';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempHumiPage extends StatefulWidget {
  const TempHumiPage({Key? key}) : super(key: key);

  @override
  State<TempHumiPage> createState() => _TempHumiPageState();
}

class _TempHumiPageState extends State<TempHumiPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bioGreen,
          elevation: 0,
          title: Text("home_sıcaklıkvenem".tr),
          centerTitle: true,
        ),

        body: Padding(
          padding:  EdgeInsets.all(Dimensions.padWidth10),
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("sıcaklık".tr,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                  SizedBox(
                    width: Dimensions.width200/2,
                    height: Dimensions.height200/2,
                    child: Image.asset(
                      "assets/temp_image.png",
                      scale: 3,
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/temperature_char.png",
                scale: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: Dimensions.padHeight10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: Dimensions.padHeight10*2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("nem".tr,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                          SizedBox(
                            width: Dimensions.padWidth10*4,
                            height: Dimensions.padHeight10*4,
                            child: Image.asset(
                              "assets/humi_image.png",
                              scale: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Image.asset(
                      "assets/humidity_char.png",
                      scale: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
