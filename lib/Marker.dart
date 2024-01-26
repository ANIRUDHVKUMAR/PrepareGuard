import 'package:flutter/material.dart';

class Marker {
  final Offset position;
  final String description;

  Marker({
    required this.position,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'position_dx': position.dx,
      'position_dy': position.dy,
      'description': description,
    };
  }

  factory Marker.fromJson(Map<String, dynamic> json) {
    return Marker(
      position: Offset(json['position_dx'], json['position_dy']),
      description: json['description'],
    );
  }
}
