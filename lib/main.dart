import 'package:biocoder/Pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    );
  }
}
