import 'package:biocoder/Pages/audio_page.dart';
import 'package:biocoder/Pages/home_page.dart';
import 'package:biocoder/Pages/location_page.dart';
import 'package:biocoder/Pages/login.dart';
import 'package:biocoder/Pages/tem_humi_char_page.dart';
import 'package:biocoder/Pages/temp_humi_page.dart';
import 'package:biocoder/Pages/weather_welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Pages/settings_page.dart';
import 'Pages/status_page.dart';
import 'Pages/support_page.dart';
import 'Pages/user_page.dart';
import 'Pages/weight_page.dart';
import 'Utils/translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(

      translations: Messages(),
      locale: const Locale('tr', 'TR'),
      fallbackLocale: const Locale('en', 'UK'),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      //initialRoute: "/",
      /*getPages: [
        GetPage(name: "/", page: ()=>  LoginScreen()),
        GetPage(name: "/home", page: ()=>  const HomePage()),
        GetPage(name: "/audio", page: ()=>  const AudioPage()),
        GetPage(name: "/location", page: ()=>   LocationPage()),
        GetPage(name: "/setting", page: ()=>  const SettingsPage()),
        GetPage(name: "/status", page: ()=>  const StatusPage()),
        GetPage(name: "/support", page: ()=>  const SupportPage()),
        GetPage(name: "/temphumi", page: ()=>  const TempHumiPage()),
        GetPage(name: "/temphumichart", page: ()=>  const TempHumiCharPage()),
        GetPage(name: "/user", page: ()=>  const UserPage()),
        GetPage(name: "/weight", page: ()=>  const WeightPage()),
        GetPage(name: "/weatherwelcome", page: ()=>  const WeatherWelcomePage()),
      ],
*/
    );
  }
}
