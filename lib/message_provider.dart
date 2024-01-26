// lib/message_provider.dart
import 'package:flutter/material.dart';
import 'message_model.dart';

class MessageProvider extends ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }
}
