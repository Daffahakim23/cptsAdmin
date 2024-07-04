import 'package:flutter/material.dart';
import '../models/chat_message.dart';

class ChatRoomScreen extends StatefulWidget {
  final Conversation conversation;

  const ChatRoomScreen({Key? key, required this.conversation})
      : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(
        () {
          widget.conversation.messages.add(
            ChatMessage(
              sender: 'You',
              message: _controller.text,
              timestamp: DateTime.now(),
            ),
          );

          widget.conversation.messages.add(
            ChatMessage(
              sender: 'Bot',
              message: 'okee',
              timestamp: DateTime.now(),
            ),
          );
          _controller.clear();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.conversation.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.conversation.messages.length,
              itemBuilder: (context, index) {
                final message = widget.conversation.messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    final isMe = message.sender == 'You';
    final alignment = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isMe ? Colors.blue[100] : Colors.grey[300];
    final textColor = isMe ? Colors.black : Colors.black;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: alignment,
          children: [
            Text(
              message.message,
              style: TextStyle(
                  color: textColor, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            // const SizedBox(height: 5),
            Text(
              '${message.timestamp.hour}:${message.timestamp.minute}',
              style: TextStyle(color: textColor, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
