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
          centerTitle: true,

          title: Text("home_konum".tr),
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