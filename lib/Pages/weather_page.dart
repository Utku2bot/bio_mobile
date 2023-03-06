import 'dart:convert';
import 'package:biocoder/Models/weather_model.dart';
import 'package:biocoder/Pages/home_page.dart';
import 'package:biocoder/Utils/colors.dart';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';




class WeatherPage extends StatefulWidget {
    WeatherPage({Key? key,required this.position}) : super(key: key);
   Position position;
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {


  Future<Weather> fetchWeather() async {
    final resp = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${widget.position.latitude}&lon=${widget.position.longitude}&appid=24929a5b84eefeed512bdb9387f9b021"));

    if (resp.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(resp.body);

      return Weather.fromJson(json);
    } else {
      throw Exception('Veriler yüklenemedi...');
    }
  }


  late Future<Weather> myWeather;

  @override
  void initState() {

    super.initState();
    myWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Dimensions.toolbarHeight,
        leading: IconButton(
            onPressed: () {
              Get.to(()=> const HomePage());
            },
            icon: const Icon(Icons.arrow_back)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: bioBlue,
      body: Padding(
        padding:  EdgeInsets.only(
          left: Dimensions.padWidth10*1.5,
          right: Dimensions.padWidth10*1.5,
          top: Dimensions.padHeight30,
        ),
        child: Stack(
          children: [
            SafeArea(
              top: true,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [],
                  ),
                   SizedBox(
                    height: Dimensions.padHeight10*2,
                  ),
                  FutureBuilder<Weather>(
                    future: myWeather,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data!.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             SizedBox(
                              height: Dimensions.padHeight10,
                            ),
                            Text(
                              snapshot.data!.weather[0]['main'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             SizedBox(
                              height: Dimensions.padHeight10,
                            ),
                            Text(
                              '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}  ',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                             SizedBox(height: Dimensions.padHeight10*2),
                            Container(
                              height:( Dimensions.height200/2)*1.5,
                              width: Dimensions.width200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                  'assets/cloudy.png',
                                ),
                              )),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                     Text(
                                      'weather_sıcaklık'.tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                     SizedBox(
                                      height: Dimensions.padHeight10,
                                    ),
                                    Text(
                                      '${((snapshot.data!.main['temp'] - 32 * 5) / 9).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              SizedBox(
                                  width: Dimensions.padWidth50,
                                ),
                                Column(
                                  children: [
                                     Text(
                                      'weather_rüzgar'.tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  SizedBox(
                                      height: Dimensions.padHeight10,
                                    ),
                                    Text(
                                      '${snapshot.data!.wind['speed']} km/h',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                 SizedBox(
                                  width: Dimensions.padWidth50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'weather_nem'.tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.padHeight10,
                                    ),
                                    Text(
                                      '${snapshot.data!.main['humidity']}%',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                           SizedBox(
                              height: Dimensions.padHeight10*3,
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Veriler yüklenemedi..');
                      } else {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }
                    },
                  ),
                  Text("havakalitesi".tr,style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: Dimensions.padHeight10,),
                  Image.asset(
                    "assets/air_char.png",
                    scale: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
