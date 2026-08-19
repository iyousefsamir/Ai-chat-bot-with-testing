import 'package:ai_chat_bot_with_testing/models/chat_message_model.dart';
import 'package:ai_chat_bot_with_testing/widgets/failure_bubble.dart';
import 'package:flutter/material.dart';

import 'chat_bubble.dart';
import 'chat_loading_bubble.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key, required this.messages});

  final List<ChatMessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var newindex = messages.length - (index + 1);
        if (index == messages.length) {
          return const ChatLoadingBubble();
        }
        final msg = messages[newindex];
        return ChatBubble(message: msg);
      },
    );
  }
}

class LoadingChatMessageList extends StatelessWidget {
  const LoadingChatMessageList({super.key, required this.messages});
  final List<ChatMessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {
        var newindex = messages.length - index;
        if (index == 0) {
          return const ChatLoadingBubble();
        }
        final msg = messages[newindex];
        return ChatBubble(message: msg);
      },
    );
  }
}

class FailureChatMessageList extends StatelessWidget {
  const FailureChatMessageList({
    super.key,
    required this.messages,
    required this.onRetry,
  });

  final List<ChatMessageModel> messages;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final newindex = messages.length - (index + 1);
        final msg = messages[newindex];

        if (index == 0) {
          return FailureBubble(message: msg, onRetry: onRetry);
        }

        return ChatBubble(message: msg);
      },
    );
  }
}
