// lib/relief_camps_map.dart

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReliefCampsMap extends StatefulWidget {
  @override
  _ReliefCampsMapState createState() => _ReliefCampsMapState();
}

class _ReliefCampsMapState extends State<ReliefCampsMap> {
  GoogleMapController? mapController;

  final LatLng reliefCampLocation =
      LatLng(37.7749, -122.4194); // Replace with actual relief camp location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relief Camps Map'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: reliefCampLocation,
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('reliefCamp'),
            position: reliefCampLocation,
            infoWindow: InfoWindow(title: 'Relief Camp'),
          ),
        },
      ),
    );
  }
}
