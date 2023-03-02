import 'package:biocoder/Pages/login.dart';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:biocoder/Widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';

const nbs = <int>[3, 4, 5, 6, 7, 8, 9, 10];
const rotates = <double>[0, 30, 60, 90, 120, 150, 180];
const colors = <Color>[
  Colors.black,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double size = 60;
    double offset = 30;

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
      body: Container(
        height: 440,
        width: 380,
        color: Colors.yellow,

        child: Stack(
alignment: Alignment.topCenter,
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
                        NewWidget(rotation: 90,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NewWidget(rotation: 90,),
                        NewWidget(rotation: 90),
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
                            height: 220,
                          ),
                          NewWidget(rotation: 90,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NewWidget(rotation: 90,),
                          NewWidget(rotation: 90),
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
                            height: 220,
                          ),
                          NewWidget(rotation: 90,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NewWidget(rotation: 90,),
                          NewWidget(rotation: 90),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            )
                    ],
        ),
      )
    );
  }
}

class NewWidget extends StatelessWidget {
  final double rotation;

  const NewWidget({
    super.key,
    required this.rotation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipPolygon(
            sides: 6,
            borderRadius: 5.0, // Defaults to 0.0 degrees
            rotate: rotation, // Defaults to 0.0 degrees
            boxShadows: [
              PolygonBoxShadow(color: Colors.black, elevation: 10.0),
            ],
          ),
          ClipPolygon(
              sides: 6,
              borderRadius: 5.0,
              // Defaults to 0.0 degrees
              rotate: rotation,
              // Defaults to 0.0 degrees
              boxShadows: [
                PolygonBoxShadow(color: Colors.black, elevation: 0.0),
              ],
              child: ElevatedButton(
                onPressed: () {},
                child: Text("deneme"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(bioGrey),
                ),
              )),
        ],
      ),
    );
  }
}
