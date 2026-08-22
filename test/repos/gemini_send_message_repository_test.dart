import 'package:ai_chat_bot_with_testing/repositories/gemini_send_message_repository.dart';
import 'package:ai_chat_bot_with_testing/services/gemini_chat_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GemanaiChatServiceMock extends Mock implements GeminiChatService {}

void main() {
  late GeminiSendMessageRepository geminiSendMessageRepository;

  setUp(() {
    geminiSendMessageRepository = GeminiSendMessageRepository(
      chatService: GemanaiChatServiceMock(),
    );
  });
}
