import 'dart:convert';
import 'package:biocoder/Pages/location_welcome_page.dart';
import 'package:biocoder/Pages/login.dart';
import 'package:biocoder/Pages/settings_page.dart';
import 'package:biocoder/Pages/status_page.dart';
import 'package:biocoder/Pages/support_page.dart';
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
import 'package:http/http.dart' as htt;

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

      height: 520, //520
      width: 360,  //360
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              HexagonContainer(
                color: bioGold,
                onTap: () {
                  Get.to(() =>  const SettingsPage());
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
                      const SizedBox(
                        width: 50,
                        height: 220,
                      ),
                      HexagonContainer(
                        color: bioGold,
                        onTap: () async{
                          try {
                            htt.Response response = await htt.post(
                                Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/userData"),
                                headers: {
                                  "Accept": "application/json",
                                  "content-type":"application/json"
                                },
                                body: jsonEncode(
                                    {
                                      "id": Get.arguments["userId"],

                                    }
                                )
                            );
                            htt.Response response2 = await htt.post(
                                Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/deviceData"),
                                headers: {
                                  "Accept": "application/json",
                                  "content-type":"application/json"
                                },
                                body: jsonEncode(
                                    {
                                      "id": Get.arguments["userId"],

                                    }
                                )
                            );

                            htt.Response response3 = await htt.post(
                                Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/ProductData"),
                                headers: {
                                  "Accept": "application/json",
                                  "content-type":"application/json"
                                },
                                body: jsonEncode(
                                    {
                                      "id": Get.arguments["userId"],

                                    }
                                )
                            );

                            final data = json.decode(response.body);
                            final data2 = json.decode(response2.body);
                            final data3 = json.decode(response3.body);


                            if (response.statusCode == 200 && data["status"] ==true ) {

                              Get.to(()=>StatusPage(),arguments: {

                                "tc": data["data"]["tc"],
                                "adi":data["data"]["adi"],
                                "soyadi": data["data"]["soyadi"],
                                "isletme_no":  data["data"]["isletme_no"],
                                "cep_telefon": data["data"]["cep_telefon"],
                                "username": data["data"]["username"],
                                "password": data["data"]["password"],
                                "adres": data["data"]["adres"],
                                "il": data["data"]["il"],
                                "ilce": data["data"]["ilce"],


                                "seriNO": data2["data"]["seriNO"],
                                "sicaklik": data2["data"]["sicaklik"],
                                "nem": data2["data"]["nem"],
                                "konum": data2["data"]["konum"],
                                "ses": data2["data"]["ses"],
                                "hareket": data2["data"]["hareket"],
                                "havaKalitesi": data2["data"]["havaKalitesi"],
                                "baglanti":data2["data"]["baglanti"],
                                "agirlik": data2["data"]["agirlik"],
                                "kamera": data2["data"]["kamera"],

                                "müsteriID": data3["data"]["müsteriID"],
                                "ariCinsi": data3["data"]["ariCinsi"],
                                "üretimSekli": data3["data"]["üretimSekli"],
                                "kovanCinsi": data3["data"]["kovanCinsi"],
                                "kovanSayisi": data3["data"]["kovanSayisi"]




                              });



                            }
                          } catch (e) {
                            print(e.toString());
                          }
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
                          onTap: () async{
                            try {
                              htt.Response response = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/userData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );
                              htt.Response response2 = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/deviceData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );

                              htt.Response response3 = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/ProductData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );

                              final data = json.decode(response.body);
                              final data2 = json.decode(response2.body);
                              final data3 = json.decode(response3.body);


                              if (response.statusCode == 200 && data["status"] ==true ) {
                                print(data3);
                                Get.to(()=>TempHumiPage(),arguments: {

                                  "tc": data["data"]["tc"],
                                  "adi":data["data"]["adi"],
                                  "soyadi": data["data"]["soyadi"],
                                  "isletme_no":  data["data"]["isletme_no"],
                                  "cep_telefon": data["data"]["cep_telefon"],
                                  "username": data["data"]["username"],
                                  "password": data["data"]["password"],
                                  "adres": data["data"]["adres"],
                                  "il": data["data"]["il"],
                                  "ilce": data["data"]["ilce"],


                                  "seriNO": data2["data"]["seriNO"],
                                  "sicaklik": data2["data"]["sicaklik"],
                                  "nem": data2["data"]["nem"],
                                  "konum": data2["data"]["konum"],
                                  "ses": data2["data"]["ses"],
                                  "hareket": data2["data"]["hareket"],
                                  "havaKalitesi": data2["data"]["havaKalitesi"],
                                  "baglanti":data2["data"]["baglanti"],
                                  "agirlik": data2["data"]["agirlik"],
                                  "kamera": data2["data"]["kamera"],

                                  "müsteriID": data3["data"]["müsteriID"],
                                  "ariCinsi": data3["data"]["ariCinsi"],
                                  "üretimSekli": data3["data"]["üretimSekli"],
                                  "kovanCinsi": data3["data"]["kovanCinsi"],
                                  "kovanSayisi": data3["data"]["kovanSayisi"]




                                });



                              }
                            } catch (e) {
                              print(e.toString());
                            }

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
                        onTap: () async{

                          try {
                            htt.Response response = await htt.post(
                                Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/userData"),
                                headers: {
                                  "Accept": "application/json",
                                  "content-type":"application/json"
                                },
                                body: jsonEncode(
                                    {
                                      "id": Get.arguments["userId"],

                                    }
                                )
                            );
                            htt.Response response2 = await htt.post(
                                Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/deviceData"),
                                headers: {
                                  "Accept": "application/json",
                                  "content-type":"application/json"
                                },
                                body: jsonEncode(
                                    {
                                      "id": Get.arguments["userId"],

                                    }
                                )
                            );

                            htt.Response response3 = await htt.post(
                                Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/ProductData"),
                                headers: {
                                  "Accept": "application/json",
                                  "content-type":"application/json"
                                },
                                body: jsonEncode(
                                    {
                                      "id": Get.arguments["userId"],

                                    }
                                )
                            );

                            final data = json.decode(response.body);
                            final data2 = json.decode(response2.body);
                            final data3 = json.decode(response3.body);


                            if (response.statusCode == 200 && data["status"] ==true ) {
                              print(data3);
                              Get.to(()=>UserPage(),arguments: {

                                "tc": data["data"]["tc"],
                                "adi":data["data"]["adi"],
                                "soyadi": data["data"]["soyadi"],
                                "isletme_no":  data["data"]["isletme_no"],
                                "cep_telefon": data["data"]["cep_telefon"],
                                "username": data["data"]["username"],
                                "password": data["data"]["password"],
                                "adres": data["data"]["adres"],
                                "il": data["data"]["il"],
                                "ilce": data["data"]["ilce"],


                                "seriNO": data2["data"]["seriNO"],
                                "sicaklik": data2["data"]["sicaklik"],
                                "nem": data2["data"]["nem"],
                                "konum": data2["data"]["konum"],
                                "ses": data2["data"]["ses"],
                                "hareket": data2["data"]["hareket"],
                                "havaKalitesi": data2["data"]["havaKalitesi"],
                                "baglanti":data2["data"]["baglanti"],
                                "agirlik": data2["data"]["agirlik"],
                                "kamera": data2["data"]["kamera"],

                                "müsteriID": data3["data"]["müsteriID"],
                                "ariCinsi": data3["data"]["ariCinsi"],
                                "üretimSekli": data3["data"]["üretimSekli"],
                                "kovanCinsi": data3["data"]["kovanCinsi"],
                                "kovanSayisi": data3["data"]["kovanSayisi"]




                              });



                            }
                          } catch (e) {
                            print(e.toString());
                          }

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
                              Get.to(() => const SupportPage());
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
                          onTap: () async{
                            try {
                              htt.Response response = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/userData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );
                              htt.Response response2 = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/deviceData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );

                              htt.Response response3 = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/ProductData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );

                              final data = json.decode(response.body);
                              final data2 = json.decode(response2.body);
                              final data3 = json.decode(response3.body);


                              if (response.statusCode == 200 && data["status"] ==true ) {

                                Get.to(()=>const AudioPage(),arguments: {

                                  "tc": data["data"]["tc"],
                                  "adi":data["data"]["adi"],
                                  "soyadi": data["data"]["soyadi"],
                                  "isletme_no":  data["data"]["isletme_no"],
                                  "cep_telefon": data["data"]["cep_telefon"],
                                  "username": data["data"]["username"],
                                  "password": data["data"]["password"],
                                  "adres": data["data"]["adres"],
                                  "il": data["data"]["il"],
                                  "ilce": data["data"]["ilce"],


                                  "seriNO": data2["data"]["seriNO"],
                                  "sicaklik": data2["data"]["sicaklik"],
                                  "nem": data2["data"]["nem"],
                                  "konum": data2["data"]["konum"],
                                  "ses": data2["data"]["ses"],
                                  "hareket": data2["data"]["hareket"],
                                  "havaKalitesi": data2["data"]["havaKalitesi"],
                                  "baglanti":data2["data"]["baglanti"],
                                  "agirlik": data2["data"]["agirlik"],
                                  "kamera": data2["data"]["kamera"],

                                  "müsteriID": data3["data"]["müsteriID"],
                                  "ariCinsi": data3["data"]["ariCinsi"],
                                  "üretimSekli": data3["data"]["üretimSekli"],
                                  "kovanCinsi": data3["data"]["kovanCinsi"],
                                  "kovanSayisi": data3["data"]["kovanSayisi"]




                                });



                              }
                            } catch (e) {
                              print(e.toString());
                            }

                          },
                          text: 'home_ses'.tr,
                          image: "audio_image",
                          scale: 2,
                          padding: 15,

                        ),
                        HexagonContainer(
                          color: bioBlue,
                          onTap: () {
                            Get.to(() => LocationWelcomePage());
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
                          onTap: () async {
                            try {
                              htt.Response response = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/userData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );
                              htt.Response response2 = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/deviceData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );

                              htt.Response response3 = await htt.post(
                                  Uri.parse("http://api.biocoder.com.tr/api/ValuesController1/ProductData"),
                                  headers: {
                                    "Accept": "application/json",
                                    "content-type":"application/json"
                                  },
                                  body: jsonEncode(
                                      {
                                        "id": Get.arguments["userId"],

                                      }
                                  )
                              );

                              final data = json.decode(response.body);
                              final data2 = json.decode(response2.body);
                              final data3 = json.decode(response3.body);


                              if (response.statusCode == 200 && data["status"] ==true ) {

                                Get.to(()=>WeightPage(),arguments: {

                                  "tc": data["data"]["tc"],
                                  "adi":data["data"]["adi"],
                                  "soyadi": data["data"]["soyadi"],
                                  "isletme_no":  data["data"]["isletme_no"],
                                  "cep_telefon": data["data"]["cep_telefon"],
                                  "username": data["data"]["username"],
                                  "password": data["data"]["password"],
                                  "adres": data["data"]["adres"],
                                  "il": data["data"]["il"],
                                  "ilce": data["data"]["ilce"],


                                  "seriNO": data2["data"]["seriNO"],
                                  "sicaklik": data2["data"]["sicaklik"],
                                  "nem": data2["data"]["nem"],
                                  "konum": data2["data"]["konum"],
                                  "ses": data2["data"]["ses"],
                                  "hareket": data2["data"]["hareket"],
                                  "havaKalitesi": data2["data"]["havaKalitesi"],
                                  "baglanti":data2["data"]["baglanti"],
                                  "agirlik": data2["data"]["agirlik"],
                                  "kamera": data2["data"]["kamera"],


                                  "müsteriID": data3["data"]["müsteriID"],
                                  "ariCinsi": data3["data"]["ariCinsi"],
                                  "üretimSekli": data3["data"]["üretimSekli"],
                                  "kovanCinsi": data3["data"]["kovanCinsi"],
                                  "kovanSayisi": data3["data"]["kovanSayisi"]




                                });



                              }
                            } catch (e) {
                              print(e.toString());
                            }

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
