import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';

import '../constants/constants.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> polyLineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then(
      (liveLocation) {
        currentLocation = liveLocation;
      },
    );
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      MapsConstants.apiKey,
      PointLatLng(MapsConstants.sourceLocation.latitude,
          MapsConstants.sourceLocation.longitude),
      PointLatLng(MapsConstants.destination.latitude,
          MapsConstants.destination.longitude),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
        setState(() {});
      }
    }
  }

  Timer? timer;

  @override
  void initState() {
    getPolyPoints();
    timer = Timer.periodic(
        const Duration(milliseconds: 2000), (Timer t){
      getCurrentLocation();
      currentLocation == null
          ? log("Fetching")
          : log(
          "Current Location : ${currentLocation!.latitude} , ${currentLocation!.longitude}");
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: 150,
            child: Image.asset(ImageLink.mLogo),
          ),
        ),
      ),
      body: currentLocation == null
          ? Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                  ),
                  zoom: 14.5),
              markers: {
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  position: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                ),
                const Marker(
                    markerId: MarkerId("source"),
                    position: MapsConstants.sourceLocation),
                const Marker(
                    markerId: MarkerId("destination"),
                    position: MapsConstants.destination),
              },
              polylines: {
                Polyline(
                    polylineId: const PolylineId("route"),
                    points: polyLineCoordinates,
                    color: AppTheme.primaryColor,
                    width: 6)
              },
        onMapCreated: (mapController){
                _controller.complete(mapController);
        },
            ),
    );
  }
}
