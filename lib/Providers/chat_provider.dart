import 'package:flutter/material.dart';
import '../models/chat_message.dart';

class ChatProvider with ChangeNotifier {
  List<Conversation> _conversations = [];

  ChatProvider() {
    _loadDummyData();
  }

  List<Conversation> get conversations => _conversations;

  void _loadDummyData() {
    _conversations = [
      Conversation(
        id: '1',
        name: 'Alice',
        messages: [
          ChatMessage(
            sender: 'Alice',
            message: 'Hi there!',
            timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
          ),
          ChatMessage(
            sender: 'You',
            message: 'Hello!',
            timestamp: DateTime.now(),
          ),
        ],
      ),
      Conversation(
        id: '2',
        name: 'Bob',
        messages: [
          ChatMessage(
            sender: 'Bob',
            message: 'Hey, how are you?',
            timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
          ),
        ],
      ),
    ];
    notifyListeners();
  }
}
