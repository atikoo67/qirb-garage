import 'package:qirb_garage/src/features/messaging/domain/entities/message.dart';
import 'package:qirb_garage/src/features/messaging/domain/entities/conversation_detail.dart';

/// Mock messaging data based on API documentation
class MockMessages {
  MockMessages._();

  // Messages between customer and garage owner
  static final message1 = Message(
    id: 5000,
    senderId: 12,
    senderName: 'Abebe Bikila',
    receiverId: 20,
    receiverName: 'Meseret Defar',
    content: 'Hi, is my car ready for pickup?',
    isRead: true,
    createdAt: DateTime(2026, 4, 19, 10, 30),
  );

  static final message2 = Message(
    id: 5001,
    senderId: 20,
    senderName: 'Meseret Defar',
    receiverId: 12,
    receiverName: 'Abebe Bikila',
    content: 'Hello! Yes, your car is ready. You can pick it up anytime today.',
    isRead: true,
    createdAt: DateTime(2026, 4, 19, 10, 45),
  );

  static final message3 = Message(
    id: 5002,
    senderId: 12,
    senderName: 'Abebe Bikila',
    receiverId: 20,
    receiverName: 'Meseret Defar',
    content: 'Great! I\'ll come around 3 PM. Thank you!',
    isRead: true,
    createdAt: DateTime(2026, 4, 19, 11, 0),
  );

  // Messages between customer and seller
  static final message4 = Message(
    id: 5003,
    senderId: 13,
    senderName: 'Sara Tesfaye',
    receiverId: 40,
    receiverName: 'Samuel Parts',
    content: 'Do you have brake pads for Honda Civic 2019?',
    isRead: true,
    createdAt: DateTime(2026, 4, 20, 9, 15),
  );

  static final message5 = Message(
    id: 5004,
    senderId: 40,
    senderName: 'Samuel Parts',
    receiverId: 13,
    receiverName: 'Sara Tesfaye',
    content: 'Yes, we have them in stock. Price is 2800 ETB.',
    isRead: false,
    createdAt: DateTime(2026, 4, 20, 9, 30),
  );

  // Messages between customer and staff
  static final message6 = Message(
    id: 5005,
    senderId: 14,
    senderName: 'Dawit Alemayehu',
    receiverId: 30,
    receiverName: 'Kenenisa Bekele',
    content: 'Are you on your way? I\'m waiting at the location.',
    isRead: true,
    createdAt: DateTime(2026, 4, 20, 14, 45),
  );

  static final message7 = Message(
    id: 5006,
    senderId: 30,
    senderName: 'Kenenisa Bekele',
    receiverId: 14,
    receiverName: 'Dawit Alemayehu',
    content: 'Yes, I\'ll be there in 10 minutes. Please wait.',
    isRead: true,
    createdAt: DateTime(2026, 4, 20, 14, 50),
  );

  // Conversation details
  static final conversation1 = ConversationDetail(
    id: 200,
    otherUser: const ConversationUser(
      id: 20,
      fullName: 'Meseret Defar',
      role: 'GarageOwner',
    ),
    lastMessage: 'Great! I\'ll come around 3 PM. Thank you!',
    lastMessageAt: DateTime(2026, 4, 19, 11, 0),
    unreadCount: 0,
    createdAt: DateTime(2026, 4, 19, 10, 30),
  );

  static final conversation2 = ConversationDetail(
    id: 201,
    otherUser: const ConversationUser(
      id: 40,
      fullName: 'Samuel Parts',
      role: 'SparePartSeller',
    ),
    lastMessage: 'Yes, we have them in stock. Price is 2800 ETB.',
    lastMessageAt: DateTime(2026, 4, 20, 9, 30),
    unreadCount: 1,
    createdAt: DateTime(2026, 4, 20, 9, 15),
  );

  static final conversation3 = ConversationDetail(
    id: 202,
    otherUser: const ConversationUser(
      id: 30,
      fullName: 'Kenenisa Bekele',
      role: 'Staff',
    ),
    lastMessage: 'Yes, I\'ll be there in 10 minutes. Please wait.',
    lastMessageAt: DateTime(2026, 4, 20, 14, 50),
    unreadCount: 0,
    createdAt: DateTime(2026, 4, 20, 14, 45),
  );

  static final conversation4 = ConversationDetail(
    id: 203,
    otherUser: const ConversationUser(
      id: 12,
      fullName: 'Abebe Bikila',
      role: 'User',
    ),
    lastMessage:
        'Hello! Yes, your car is ready. You can pick it up anytime today.',
    lastMessageAt: DateTime(2026, 4, 19, 10, 45),
    unreadCount: 0,
    createdAt: DateTime(2026, 4, 19, 10, 30),
  );

  // All messages list
  static final allMessages = [
    message1,
    message2,
    message3,
    message4,
    message5,
    message6,
    message7,
  ];

  static final allConversations = [
    conversation1,
    conversation2,
    conversation3,
    conversation4,
  ];

  // Get messages between two users
  static List<Message> getMessagesBetween(int userId1, int userId2) {
    return allMessages
        .where((message) =>
            (message.senderId == userId1 && message.receiverId == userId2) ||
            (message.senderId == userId2 && message.receiverId == userId1))
        .toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  // Get conversations for user
  static List<ConversationDetail> getConversationsForUser(int userId) {
    // In real app, filter by userId
    return allConversations;
  }

  // Get unread message count
  static int getUnreadCount(int userId) {
    return allMessages
        .where((message) => message.receiverId == userId && !message.isRead)
        .length;
  }

  // Get conversation by ID
  static ConversationDetail? getConversationById(int id) {
    try {
      return allConversations.firstWhere((conv) => conv.id == id);
    } catch (e) {
      return null;
    }
  }
}
