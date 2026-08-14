import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key, required this.messages}) : super(key: key);

  final List<Map<String, String>> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final isMe = msg['role'] == 'user';
        return ChatBubble(text: msg['text'] ?? '', isMe: isMe);
      },
    );
  }
}
