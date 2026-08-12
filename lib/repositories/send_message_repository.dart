import '../models/chat_message_model.dart';

abstract class SendMessageRepository {
  Future<ChatMessageModel> sendMessages(List<ChatMessageModel> messages);
}
