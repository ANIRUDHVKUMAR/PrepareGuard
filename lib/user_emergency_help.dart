import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'message_model.dart';
import 'message_provider.dart';

class UserEmergencyHelp extends StatefulWidget {
  @override
  _UserEmergencyHelpState createState() => _UserEmergencyHelpState();
}

class _UserEmergencyHelpState extends State<UserEmergencyHelp> {
  TextEditingController _messageController = TextEditingController();

  void _sendMessage(BuildContext context, String sender) {
    String messageContent = _messageController.text;

    Provider.of<MessageProvider>(context, listen: false)
        .addMessage(Message(sender, messageContent));

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Emergency Help',
          style: TextStyle(color: Colors.white), // Set text color of the title
        ),
        backgroundColor: Colors.blue, // Set the background color of the AppBar
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MessageProvider>(
              builder: (context, messageProvider, child) {
                List<Message> messages = messageProvider.messages;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Message message = messages[index];

                    return ListTile(
                      title: Align(
                        alignment: message.sender.toLowerCase() == 'user'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: message.sender.toLowerCase() == 'user'
                                ? Colors.blue
                                : Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${message.sender}: ${message.content}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(context, 'User'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
