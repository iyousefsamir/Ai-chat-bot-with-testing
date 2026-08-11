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
    final response = await _apiClient.post(
      '',
      data: {'contents': messages.map((message) => message.toJson()).toList()},
    );

    final body = response.data;

    return ChatMessageModel.fromJson(body);
  }
}
