import '../models/chat_message_model.dart';
import '../services/gemini_chat_service.dart';
import 'send_message_repository.dart';

class GeminiSendMessageRepository implements SendMessageRepository {
  GeminiSendMessageRepository({required GeminiChatService chatService})
      : _chatService = chatService;

  final GeminiChatService _chatService;

  @override
  Future<ChatMessageModel> sendMessages(List<ChatMessageModel> messages) {
    return _chatService.sendMessages(messages);
  }
}
