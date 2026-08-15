import 'package:ai_chat_bot_with_testing/models/chat_message_model.dart';
import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.messages});

  final List<ChatMessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final isMe = msg.role == 'user';

        return ChatBubble(text: msg.parts.first.text, isMe: isMe);
      },
    );
  }
}
