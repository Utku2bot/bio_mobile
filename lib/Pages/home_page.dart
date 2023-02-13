import 'package:biocoder/Pages/weather_welcome_page.dart';
import 'package:biocoder/Widgets/hexagon_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../Utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 60;
    double offset = 30;


    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Image.asset(
        "assets/biocoder.png",
        scale: 4,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HexagonWidget(size: size, color: Colors.black87, onTap: (){}, text: "Kullanıcı", offset: offset),
              HexagonWidget(size: size, color: Colors.black87, onTap: (){}, text: "Ayarlar", offset: offset),
            ],
          ),
          HexagonWidget(size: size, color: bioBlue, onTap: (){}, text: "Durum", offset: offset),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HexagonWidget(size: size, color: bioBlue, onTap: (){}, text: "Ses", offset: offset),

              HexagonWidget(size: size, color: bioBlue, onTap: (){}, text: "Konum", offset: offset),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HexagonWidget(size: size, color: bioGreen, onTap: (){}, text: "Sıcaklık ve Nem", offset: offset),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HexagonWidget(size: size, color: bioGreen, onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  WeatherWelcomePage();
                },));
              }, text: "Hava Durumu", offset: offset),

              HexagonWidget(size: size, color: bioGreen, onTap: (){}, text: "Ağırlık", offset: offset),

            ],
          ),

        ],
      ),
    );
  }
}


