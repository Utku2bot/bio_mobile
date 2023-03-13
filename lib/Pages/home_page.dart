import 'package:biocoder/Pages/login.dart';
import 'package:biocoder/Pages/settings_page.dart';
import 'package:biocoder/Pages/status_page.dart';
import 'package:biocoder/Pages/temp_humi_page.dart';
import 'package:biocoder/Pages/user_page.dart';
import 'package:biocoder/Pages/weather_welcome_page.dart';
import 'package:biocoder/Pages/weight_page.dart';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:biocoder/Widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';
import '../Widgets/hexagon_container.dart';
import 'audio_page.dart';
import 'location_page.dart';

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
        body: Padding(
          padding:  EdgeInsets.only(bottom: Dimensions.padHeight50),
          child: Center(child: buildHexagonGrid()),
        ));
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
              HexagonContainer(
                color: bioGold,
                onTap: () {
                  Get.to(() => const SettingsPage());
                },
                text: 'home_ayarlar'.tr,
                image: "audio_image",
                scale: 2,
                padding: 15,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 50,
                        height: 220,
                      ),
                      HexagonContainer(
                        color: bioGold,
                        onTap: () {
                          Get.to(() => const StatusPage());
                        },
                        text: 'home_durum'.tr,
                        image: "hive_image",
                        scale: 15,
                        padding: 15,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 127),
                        child: HexagonContainer(
                          color: bioBlue,
                          onTap: () {
                            Get.to(() => const TempHumiPage());
                          },
                          text: 'home_sıcaklıkvenem'.tr,
                          image: "temp_image",
                          scale: 3,
                          padding: 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      HexagonContainer(
                        color: bioGold,
                        onTap: () {
                          Get.to(() => const UserPage());
                        },
                        text: 'home_kullanıcı'.tr,
                        image: "user_image",
                        scale: 3,
                        padding: 14,
                      ),
                      HexagonContainer(
                        color: bioGold,
                        onTap: () {
                          Get.to(() => const SettingsPage());
                        },
                        text: 'home_ayarlar'.tr,
                        image: "settings_image",
                        scale: 12,
                        padding: 15,
                      ),
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
                          padding: EdgeInsets.only(bottom: 5),
                          child: HexagonContainer(
                            color: bioGreen,
                            onTap: () {
                              Get.to(() => const TempHumiPage());
                            },
                            text: 'yardım'.tr,
                            image: "question_image",
                            scale: 3,
                            padding: 15,

                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HexagonContainer(
                          color: bioBlue,
                          onTap: () {
                            Get.to(() => const AudioPage());
                          },
                          text: 'home_ses'.tr,
                          image: "audio_image",
                          scale: 2,
                          padding: 15,

                        ),
                        HexagonContainer(
                          color: bioBlue,
                          onTap: () {
                            Get.to(() => LocationPage());
                          },
                          text: 'home_konum'.tr,
                          image: "googlemark_image",
                          scale: 2.5,
                          padding: 14,

                        ),
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
                          color: bioGreen,
                          onTap: () {
                            Get.to(() => const WeatherWelcomePage());
                          },
                          text: 'home_havadurumu'.tr,
                          image: "weather_image",
                          scale: 14,
                          padding: 15,

                        ),
                        HexagonContainer(
                          color: bioGreen,
                          onTap: () {
                            Get.to(() => const WeightPage());
                          },
                          text: 'home_ağırlık'.tr,
                          image: "weight_image",
                          scale: 2,
                          padding: 15,

                        ),
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
