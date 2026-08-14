import 'package:flutter/material.dart';

import '../constants/sample_messages.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_list.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody());
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
        const MessageInput(),
      ],
    );
  }
}
