import 'package:ai_chat_bot_with_testing/models/chat_message_model.dart';
import 'package:flutter/material.dart';

// import '../utils/chat_colors.dart';

class FailureBubble extends StatelessWidget {
  const FailureBubble({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final ChatMessageModel message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(18);

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.only(
            topLeft: radius,
            topRight: radius,
            bottomLeft: radius,
            bottomRight: Radius.zero,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                message.parts.first.text,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: onRetry,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.refresh, color: Colors.red, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
