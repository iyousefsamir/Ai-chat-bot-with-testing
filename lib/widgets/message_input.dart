import 'package:flutter/material.dart';

import '../utils/chat_colors.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    // Send message logic here
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          children: [
            Expanded(child: _buildInputField()),
            const SizedBox(width: 8),
            _buildSendButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: ChatColors.inputBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Write your message',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        minLines: 1,
        maxLines: 4,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildSendButton() {
    return Container(
      decoration: const BoxDecoration(
        color: ChatColors.primary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: _sendMessage,
        color: ChatColors.onPrimary,
        icon: const Icon(Icons.arrow_upward, size: 20),
      ),
    );
  }
}
