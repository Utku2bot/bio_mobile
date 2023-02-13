import 'package:biocoder/Pages/weather_page.dart';
import 'package:biocoder/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';


class WeatherWelcomePage extends StatefulWidget {
  WeatherWelcomePage({Key? key}) : super(key: key);


  @override
  State<WeatherWelcomePage> createState() => _WeatherWelcomePageState();
}


class _WeatherWelcomePageState extends State<WeatherWelcomePage> {
  late var lat;
  late var long;
  @override
  void initState() {
    getCurrentLocation();
     Future.delayed(const Duration(seconds: 5)).then((value) => {
     Navigator.push(context, MaterialPageRoute(builder: (context) {
     return  WeatherPage(lat: lat,long: long,);
     },))
     });

    super.initState();
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disable");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission==LocationPermission.denied) {
        return Future.error("Location permission is denied");

      }
    }
    if(permission==LocationPermission.deniedForever){
      return Future.error("Location permission are permanenlty denied");
    }
    var position = await Geolocator.getCurrentPosition();


    long = position.longitude;
    lat = position.latitude;



    return await Geolocator.getCurrentPosition();
  }



  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: SpinKitCircle(
          size: 100,
          color: bioGreen,
        )
      ),
    );
  }
}



