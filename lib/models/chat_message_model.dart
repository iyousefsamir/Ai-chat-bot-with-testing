class ChatMessagePart {
  ChatMessagePart({required this.text, this.thoughtSignature});

  final String text;
  final String? thoughtSignature;

  factory ChatMessagePart.fromJson(Map<String, dynamic> json) {
    return ChatMessagePart(
      text: json['text'] as String? ?? '',
      thoughtSignature: json['thoughtSignature'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{'text': text};

    if (thoughtSignature != null) {
      result['thoughtSignature'] = thoughtSignature;
    }

    return result;
  }
}

class ChatMessageModel {
  ChatMessageModel({required this.parts, this.role});

  final String? role;
  final List<ChatMessagePart> parts;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    final partsJson = json['parts'] as List<dynamic>? ?? <dynamic>[];

    return ChatMessageModel(
      role: json['role'] as String?,
      parts: partsJson
          .map((item) => ChatMessagePart.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'parts': parts.map((part) => part.toJson()).toList(),
    };

    if (role != null) {
      data['role'] = role;
    }

    return data;
  }
}
