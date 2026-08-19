import 'package:ai_chat_bot_with_testing/cubit/send_message_cubit.dart';
import 'package:ai_chat_bot_with_testing/cubit/send_message_state.dart';
import 'package:ai_chat_bot_with_testing/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_list.dart';

class ChatMessageListBlocConsumer extends StatelessWidget {
  const ChatMessageListBlocConsumer({super.key, required this.messages});

  final List<ChatMessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMessageCubit, SendMessageState>(
      listener: (context, state) {
        if (state is SendMessageSuccess) {
          messages.add(state.message);
        }
      },
      builder: (context, state) {
        if (state is SendMessageLoading) {
          return LoadingChatMessageList(messages: messages);
        }

        if (state is SendMessageFailure) {
          print('FAILURE STATE: ${state.error}');
          return FailureChatMessageList(
            messages: messages,
            onRetry: () {
              context.read<SendMessageCubit>().sendMessages(messages);
            },
          );
        }

        return ChatMessageList(messages: messages);
      },
    );
  }
}
