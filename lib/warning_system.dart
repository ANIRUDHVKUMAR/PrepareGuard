// lib/warning_system.dart

import 'package:flutter/material.dart';

class WarningSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warning System'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add code to trigger a warning/alert
            // You can use notifications or any other method as needed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Warning Alert'),
                  content: Text('Water level is rising steeply. Be ALERT!!!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Trigger Warning'),
        ),
      ),
    );
  }
}
