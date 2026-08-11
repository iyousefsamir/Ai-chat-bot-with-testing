import 'package:dio/dio.dart';

class ApiClient {
  ApiClient({String? baseUrl, Dio? dio})
    : _baseUrl = baseUrl ?? '',
      _dio = dio ?? Dio();

  final String _baseUrl;
  final Dio _dio;

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final url = _baseUrl.isEmpty ? path : '$_baseUrl$path';

    return await _dio.post<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}


/*
chat message model
gemini chat service =>  send message method(List<chatMessageModel>) => message model
response =>    body =>
requset to be made

*/