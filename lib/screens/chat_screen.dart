import 'package:ai_chat_bot_with_testing/cubit/send_message_cubit.dart';
import 'package:ai_chat_bot_with_testing/models/chat_message_model.dart';
import 'package:ai_chat_bot_with_testing/repositories/gemini_send_message_repository.dart';
import 'package:ai_chat_bot_with_testing/services/gemini_chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/sample_messages.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_list.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageModel> messages = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendMessageCubit(
        repository: GeminiSendMessageRepository(
          chatService: GeminiChatService(),
        ),
      ),
      child: Scaffold(appBar: _buildAppBar(context), body: _buildBody()),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleSpacing: 0,
      toolbarHeight: 60,
      title: const ChatHeader(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(child: ChatList(messages: sampleMessages)),
        MessageInput(messages: messages),
      ],
    );
  }
}
