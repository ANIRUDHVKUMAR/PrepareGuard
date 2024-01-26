import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'message_model.dart';
import 'message_provider.dart';

class UserWarningSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(
      builder: (context, messageProvider, child) {
        List<Message> messages = messageProvider.messages;

        return Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                Message message = messages[index];
                bool isWarningMessage = message.sender.toLowerCase() == 'admin';

                return ListTile(
                  title: Center(
                    child: Text(
                      '${message.sender}: ${message.content}',
                      style: TextStyle(
                        fontWeight: isWarningMessage
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isWarningMessage ? Colors.red : null,
                        fontSize: 20,
                        // Adjust the font size as needed
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
