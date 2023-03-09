import 'package:biocoder/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(36.899860, 34.869781);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;


  }
  final Marker markers = Marker(markerId: MarkerId("1"),position: LatLng(36.899860, 34.869781));



  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("home_konum".tr),
              SizedBox(
                width: Dimensions.width200/2,
                height:  Dimensions.height200/2,
                child:  Image.asset(
                  "assets/googlemark_image.png",
                  scale: 2,
                ),
              )

            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          markers: {markers},
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,

          ),
        ),
      );
  }
}