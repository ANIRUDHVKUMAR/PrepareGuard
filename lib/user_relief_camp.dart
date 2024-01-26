import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'marker_provider.dart';

class UserReliefCampPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final markerProvider = Provider.of<MarkerProvider>(context);
    final markers = markerProvider.markers;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Relief Camp',
          style: TextStyle(color: Colors.white), // Set text color of the title
        ),
        backgroundColor: Colors.blue, // Set the background color of the AppBar
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/ekm_map.png', // Replace with your image path
            fit: BoxFit.cover,
          ),
          for (var marker in markers)
            Positioned(
              left: marker.position.dx - 10.0,
              top: marker.position.dy - 10.0,
              child: GestureDetector(
                onTap: () {
                  _showMarkerDetailsDialog(context, marker);
                },
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.black, // Customize the marker color
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showMarkerDetailsDialog(BuildContext context, Marker marker) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Marker Details'),
          content: Column(
            children: [
              Text('Description: ${marker.description}'),
              Text(
                'Position: ${marker.position.dx.toInt()}, ${marker.position.dy.toInt()}',
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
