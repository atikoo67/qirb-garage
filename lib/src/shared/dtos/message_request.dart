/// Send message request DTO
class SendMessageRequest {
  final int receiverId;
  final String content;

  const SendMessageRequest({
    required this.receiverId,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'receiverId': receiverId,
      'content': content,
    };
  }
}

/// Initiate conversation request DTO
class InitiateConversationRequest {
  final int receiverId;

  const InitiateConversationRequest({
    required this.receiverId,
  });

  Map<String, dynamic> toJson() {
    return {
      'receiverId': receiverId,
    };
  }
}
