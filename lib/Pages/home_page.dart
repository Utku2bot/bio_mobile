import 'package:biocoder/Pages/login.dart';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:biocoder/Widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';
import '../Widgets/hexagon_container.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {


    void changeLanguage() {
      Get.updateLocale(Get.locale == const Locale("tr", "TR")
          ? const Locale("en", "EN")
          : const Locale("tr", "TR"));
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: Dimensions.toolbarHeight,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.padWidth10, top: Dimensions.padHeight10),
              child: MyButton(
                  color: bioGreen,
                  text: 'button_lang'.tr,
                  width: Dimensions.padWidth50,
                  height: Dimensions.padHeight30,
                  onTap: changeLanguage),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: InkWell(
          child: Image.asset(
            "assets/logbee.png",
            scale: 8,
          ),
          onTap: () {
            Get.to(() => LoginScreen());
          },
        ),
        body: Center(child: buildHexagonGrid()));
  }


  Container buildHexagonGrid() {
    return Container(
        height: 520,
        width: 360,

        child: Stack(
        children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(

                          width: 50,
                          height: 220,

                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 130),
                          child: HexagonContainer(
                            rotation: 90,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HexagonContainer(
                          rotation: 90,
                        ),
                        HexagonContainer(rotation: 90),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 50,
                            height: 280,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom :  5),
                            child: HexagonContainer(
                              rotation:90,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HexagonContainer(
                            rotation: 90,
                          ),
                          HexagonContainer(rotation: 90),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 50,
                            height: 270,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HexagonContainer(
                            rotation: 90,
                          ),
                          HexagonContainer(rotation: 90),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}


