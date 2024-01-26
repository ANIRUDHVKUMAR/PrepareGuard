import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'marker_provider.dart';

class AdminReliefCampPage extends StatefulWidget {
  @override
  _AdminReliefCampPageState createState() => _AdminReliefCampPageState();
}

class _AdminReliefCampPageState extends State<AdminReliefCampPage> {
  bool _isAddingMarker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Relief Camp',
          style: TextStyle(color: Colors.white), // Set text color of the title
        ),
        backgroundColor: Colors.blue, // Set the background color of the AppBar
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTapDown: (details) {
              if (_isAddingMarker) {
                _addMarker(details.globalPosition);
              }
            },
            child: Image.asset(
              'assets/ekm_map.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 20.0,
            bottom: 20.0,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAddingMarker = !_isAddingMarker;
                });
              },
              child: Text(_isAddingMarker ? 'Stop Adding' : 'Add Marker'),
            ),
          ),
          for (var marker in Provider.of<MarkerProvider>(context).markers)
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
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _addMarker(Offset position) {
    _showDescriptionDialog(context, position);
  }

  void _deleteMarker(Marker marker) {
    setState(() {
      Provider.of<MarkerProvider>(context, listen: false)
          .markers
          .remove(marker);
      _saveMarkers(); // Save markers after deletion
    });
  }

  Future<void> _saveMarkers() async {
    // Save markers to SharedPreferences
    // ... (use the provided code in the previous responses)
  }

  void _showDescriptionDialog(BuildContext context, Offset position) {
    String _currentDescription = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Marker Description'),
          content: Column(
            children: [
              TextField(
                onChanged: (value) {
                  _currentDescription = value;
                },
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Provider.of<MarkerProvider>(context, listen: false).addMarker(
                    Marker(
                      position: position,
                      description: _currentDescription,
                    ),
                  );
                  _saveMarkers(); // Save markers after addition
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add Marker'),
            ),
          ],
        );
      },
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
            ElevatedButton(
              onPressed: () {
                // Add functionality to delete the marker here
                _deleteMarker(marker);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete Marker'),
            ),
          ],
        );
      },
    );
  }
}
