import 'package:flutter/material.dart';

class WarningSystem extends StatefulWidget {
  @override
  _WarningSystemState createState() => _WarningSystemState();
}

class _WarningSystemState extends State<WarningSystem> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warning System'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Enter warning message',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String warningMessage = _messageController.text;
                if (warningMessage.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Warning Alert'),
                        content: Text(warningMessage),
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
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a warning message.'),
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
                }
              },
              child: Text('Trigger Warning'),
            ),
          ],
        ),
      ),
    );
  }
}
