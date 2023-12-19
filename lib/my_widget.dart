// my_widget.dart
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text(
          'Hello, Custom Font!',
          style: TextStyle(fontFamily: 'ElegantScript'),
        ),
      ),
    );
  }
}
