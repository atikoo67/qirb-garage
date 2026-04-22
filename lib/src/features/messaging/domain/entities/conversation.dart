import 'package:equatable/equatable.dart';

/// Conversation entity for chat threads
class Conversation extends Equatable {
  final String id;
  final int participantId;
  final String participantName;
  final String? participantRole;
  final String? lastMessage;
  final DateTime? lastMessageAt;
  final int unreadCount;
  final DateTime createdAt;

  const Conversation({
    required this.id,
    required this.participantId,
    required this.participantName,
    this.participantRole,
    this.lastMessage,
    this.lastMessageAt,
    required this.unreadCount,
    required this.createdAt,
  });

  bool get hasUnread => unreadCount > 0;

  @override
  List<Object?> get props => [
        id,
        participantId,
        participantName,
        participantRole,
        lastMessage,
        lastMessageAt,
        unreadCount,
        createdAt,
      ];
}
