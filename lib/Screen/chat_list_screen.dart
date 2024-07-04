import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/chat_provider.dart';
import 'chat_room_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, provider, child) {
          if (provider.conversations.isEmpty) {
            return const Center(
              child: Text('No conversations found'),
            );
          } else {
            return ListView.builder(
              itemCount: provider.conversations.length,
              itemBuilder: (context, index) {
                final conversation = provider.conversations[index];
                return ListTile(
                  title: Text(conversation.name),
                  subtitle: Text(conversation.messages.isNotEmpty
                      ? conversation.messages.last.message
                      : 'No messages yet'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatRoomScreen(
                          conversation: conversation,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
