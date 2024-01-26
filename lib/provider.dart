import 'package:flutter/material.dart';

class MarkerProvider extends ChangeNotifier {
  List<Marker> _markers = [];

  List<Marker> get markers => _markers;

  void addMarker(Marker marker) {
    _markers.add(marker);
    notifyListeners();
  }
}

class Marker {
  final Offset position;
  final String description;

  Marker({
    required this.position,
    required this.description,
  });
}
