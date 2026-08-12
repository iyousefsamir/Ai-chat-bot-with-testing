import 'package:dio/dio.dart';

import '../models/chat_message_model.dart';
import 'api_client.dart';

class GeminiChatService {
  GeminiChatService({
    required String apiKey,
    ApiClient? apiClient,
    String baseUrl =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent',
  }) : _apiClient =
           apiClient ??
           ApiClient(
             baseUrl: baseUrl,
             dio: Dio(
               BaseOptions(
                 headers: {
                   'x-goog-api-key': apiKey,
                   'Content-Type': 'application/json',
                 },
               ),
             ),
           );

  final ApiClient _apiClient;

  Future<ChatMessageModel> sendMessages(List<ChatMessageModel> messages) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '',
      data: {'contents': messages.map((message) => message.toJson()).toList()},
    );

    final body = response.data;
    if (body == null) {
      throw Exception('Gemini response contained no body.');
    }

    final candidates = body['candidates'] as List<dynamic>?;
    if (candidates == null || candidates.isEmpty) {
      throw Exception('Gemini response contained no candidates.');
    }

    final firstCandidate = candidates.first as Map<String, dynamic>;
    final content = firstCandidate['content'] as Map<String, dynamic>?;
    if (content == null) {
      throw Exception('Gemini response candidate had no content.');
    }

    return ChatMessageModel.fromJson(content);
  }
}
