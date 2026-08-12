import '../models/chat_message_model.dart';

abstract class SendMessageState {}

class SendMessageInitial extends SendMessageState {}

class SendMessageLoading extends SendMessageState {}

class SendMessageSuccess extends SendMessageState {
  SendMessageSuccess(this.message);

  final ChatMessageModel message;
}

class SendMessageFailure extends SendMessageState {
  SendMessageFailure(this.error);

  final String error;
}
