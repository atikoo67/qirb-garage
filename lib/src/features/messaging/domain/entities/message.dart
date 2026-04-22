import 'package:equatable/equatable.dart';

/// Message entity for chat functionality
class Message extends Equatable {
  final int id;
  final int senderId;
  final String senderName;
  final int receiverId;
  final String receiverName;
  final String content;
  final bool isRead;
  final DateTime createdAt;

  const Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.receiverId,
    required this.receiverName,
    required this.content,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        senderId,
        senderName,
        receiverId,
        receiverName,
        content,
        isRead,
        createdAt,
      ];
}
