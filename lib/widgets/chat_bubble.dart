import 'package:flutter/material.dart';

import '../models/chat_message_model.dart';
import '../utils/chat_colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.message}) : super(key: key);

  final ChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    final isMe = message.role == 'user';
    final radius = Radius.circular(18);
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isMe ? ChatColors.outgoingBubble : ChatColors.incomingBubble,
          borderRadius: BorderRadius.only(
            topLeft: radius,
            topRight: radius,
            bottomLeft: isMe ? radius : Radius.zero,
            bottomRight: isMe ? Radius.zero : radius,
          ),
        ),
        child: Text(
          message.parts.first.text,
          style: TextStyle(
            color: isMe ? ChatColors.onPrimary : Colors.black87,
            fontSize: 15,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
