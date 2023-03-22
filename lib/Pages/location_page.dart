

import 'package:biocoder/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

class LocationPage extends StatefulWidget {
  LocationPage({Key? key, required this.positions}) : super(key: key);
  Position positions;



  @override
  State<LocationPage> createState() => _LocationPageState();
}


class _LocationPageState extends State<LocationPage> {

  /* late GoogleMapController mapController;

  final LatLng _center = const LatLng(36.899860, 34.869781);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }*/

  //late Position positions;



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
  final mapController = MapController();
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("home_konum".tr),
        backgroundColor: Colors.green[700],
      ),
      body: /*GoogleMap(
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapToolbarEnabled: true,
          markers: {markers},
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,

          ),
        ),*/
          FlutterMap(
       mapController: mapController,
        options: MapOptions(
          center: latLng.LatLng(widget.positions.latitude, widget.positions.longitude),
          zoom: 9.2,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
            subdomains: ["a", "b", "c"],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: latLng.LatLng(widget.positions.latitude, widget.positions.longitude),
                width: 30,
                height: 30,
                builder: (context) => Image.asset("assets/googlemark_image.png"),

              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed: () async {
       Position positions = await getCurrentLocation();
        setState(() {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LocationPage(positions: positions)));
        });

      },backgroundColor: bioGreen,mini: true,child: const Icon(Icons.place_rounded,color: bioBlue,),),
    );
  }
}
