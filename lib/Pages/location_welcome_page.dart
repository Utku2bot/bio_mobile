import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:future_builder_ex/future_builder_ex.dart';
import 'package:geolocator/geolocator.dart';
import '../Utils/colors.dart';
import 'location_page.dart';

class LocationWelcomePage extends StatefulWidget {
 const LocationWelcomePage({Key? key}) : super(key: key);



  @override
  State<LocationWelcomePage> createState() => _LocationWelcomePageState();
}

class _LocationWelcomePageState extends State<LocationWelcomePage> {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {


      return Future.error("Location services are disable");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are permanent denied");
    }

    return await Geolocator.getCurrentPosition();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilderEx<Position>(
          future: getCurrentLocation,
          waitingBuilder: (context) => const SpinKitCircle(
            color : bioGreen,
            size: 100,
          ),
          builder: (context, data) {
            return LocationPage(positions: data!,);
          },
        ),
      ),
    );
  }
}
