import 'package:equatable/equatable.dart';

/// Detailed conversation entity from /messages/conversations
class ConversationDetail extends Equatable {
  final int id;
  final ConversationUser otherUser;
  final String? lastMessage;
  final DateTime? lastMessageAt;
  final int unreadCount;
  final DateTime createdAt;

  const ConversationDetail({
    required this.id,
    required this.otherUser,
    this.lastMessage,
    this.lastMessageAt,
    required this.unreadCount,
    required this.createdAt,
  });

  bool get hasUnread => unreadCount > 0;

  @override
  List<Object?> get props => [
        id,
        otherUser,
        lastMessage,
        lastMessageAt,
        unreadCount,
        createdAt,
      ];
}

/// Other user in conversation
class ConversationUser extends Equatable {
  final int id;
  final String fullName;
  final String? role;
  final String? photoUrl;

  const ConversationUser({
    required this.id,
    required this.fullName,
    this.role,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [id, fullName, role, photoUrl];
}
