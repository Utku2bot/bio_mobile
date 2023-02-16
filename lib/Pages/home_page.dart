import 'package:biocoder/Pages/weather_welcome_page.dart';
import 'package:biocoder/Widgets/hexagon_widget.dart';
import 'package:biocoder/Widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 60;
    double offset = 30;

    void changeLanguage(){
      Get.updateLocale(
          Get.locale == const Locale("tr","TR") ?  const Locale("en","EN")  :  const Locale("tr","TR")
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8,top: 8),
              child: MyButton(color: bioGreen, text: 'button_lang'.tr, width: 50, height: 30,
                  onTap: changeLanguage

              ),
            ),
          ],

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Image.asset(
          "assets/biocoder.png",
          scale: 4,
        ),
        body: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HexagonWidget(size: size, color: Colors.black87, onTap: (){}, text: "home_kullanıcı".tr, offset: offset),
                HexagonWidget(size: size, color: Colors.black87, onTap: (){}, text: "home_ayarlar".tr, offset: offset),
              ],
            ),
            HexagonWidget(size: size, color: bioBlue, onTap: (){}, text: "home_durum".tr, offset: offset),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HexagonWidget(size: size, color: bioBlue, onTap: (){}, text: "home_ses".tr, offset: offset),

                HexagonWidget(size: size, color: bioBlue, onTap: (){}, text: "home_konum".tr, offset: offset),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HexagonWidget(size: size, color: bioGreen, onTap: (){}, text: "home_sıcaklıkvenem".tr, offset: offset),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HexagonWidget(size: size, color: bioGreen, onTap: (){
                  Get.to(() => const WeatherWelcomePage());
                }, text: "home_havadurumu".tr, offset: offset),

                HexagonWidget(size: size, color: bioGreen, onTap: (){}, text: "home_ağırlık".tr, offset: offset),

              ],
            ),

          ],
        ),
      ),
    );
  }
}


