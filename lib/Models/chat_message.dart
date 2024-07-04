class ChatMessage {
  final String sender;
  final String message;
  final DateTime timestamp;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.timestamp,
  });
}

class Conversation {
  final String id;
  final String name;
  final List<ChatMessage> messages;

  Conversation({
    required this.id,
    required this.name,
    required this.messages,
  });
}
