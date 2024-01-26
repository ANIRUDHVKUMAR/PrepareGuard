import 'package:flutter/material.dart';

class MarkerProvider with ChangeNotifier {
  List<Marker> markers = []; // Add this line

  // Other properties or methods can be added as needed

  // Example method to add a marker
  void addMarker(Marker marker) {
    markers.add(marker);
    notifyListeners();
  }
}

class Marker {
  final Offset position;
  final String description;

  Marker({required this.position, required this.description});
}
