import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'message_model.dart';
import 'message_provider.dart';

class AdminWarningSystem extends StatefulWidget {
  @override
  _AdminWarningSystemState createState() => _AdminWarningSystemState();
}

class _AdminWarningSystemState extends State<AdminWarningSystem> {
  TextEditingController _messageController = TextEditingController();

  void _sendMessageToUsers(BuildContext context) {
    String messageContent = _messageController.text;

    Provider.of<MessageProvider>(context, listen: false)
        .addMessage(Message('Admin', messageContent));

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Warning System',
          style: TextStyle(color: Colors.white), // Set text color of the title
        ),
        backgroundColor: Colors.blue, // Set the background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Admin Warning System Functionality'),
            SizedBox(height: 20),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Enter your message',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _sendMessageToUsers(context),
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
