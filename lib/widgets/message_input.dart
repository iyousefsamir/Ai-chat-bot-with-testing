import 'package:ai_chat_bot_with_testing/cubit/send_message_cubit.dart';
import 'package:ai_chat_bot_with_testing/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/chat_colors.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key, required this.messages});
  final List<ChatMessageModel> messages;
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
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    widget.messages.add(ChatMessageModel.user(text));
    _controller.clear();
    context.read<SendMessageCubit>().sendMessages(widget.messages);
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
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: Colors.grey.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: Colors.grey.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: ChatColors.primary, width: 1.5),
        ),
        filled: true,
        fillColor: ChatColors.inputBackground,
        hintText: 'Write your message',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        isDense: true,
      ),
      minLines: 1,
      maxLines: 4,
      style: const TextStyle(fontSize: 14),
    );
  }

  Widget _buildSendButton() {
    return Container(
      decoration: const BoxDecoration(
        color: ChatColors.onPrimary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: _sendMessage,
        color: ChatColors.primary,
        icon: const Icon(Icons.send_rounded, size: 20),
      ),
    );
  }
}
