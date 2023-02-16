import 'package:biocoder/Pages/login_page.dart';
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
      translations: Messages(), // your translations
      locale: const Locale('tr', 'TR'), // translations will be displayed in that locale
      fallbackLocale: const Locale('en', 'UK'), // specify the fallback locale in case an invalid locale is selected.

      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
