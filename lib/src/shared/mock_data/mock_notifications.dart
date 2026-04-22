import 'package:qirb_garage/src/features/notifications/domain/entities/notification.dart';
import 'package:qirb_garage/src/features/notifications/domain/entities/notification_counts.dart';

/// Mock notification data based on API documentation
class MockNotifications {
  MockNotifications._();

  // Notification counts
  static const counts = NotificationCounts(
    unreadMessages: 2,
    pendingBookings: 1,
  );

  static const countsEmpty = NotificationCounts(
    unreadMessages: 0,
    pendingBookings: 0,
  );

  static const countsHigh = NotificationCounts(
    unreadMessages: 5,
    pendingBookings: 3,
  );

  // Individual notifications
  static final notification1 = AppNotification(
    id: 1001,
    userId: 12,
    title: 'Booking Accepted',
    message: 'Your booking at Bole Garage has been accepted',
    type: 'BOOKING',
    isRead: false,
    data: {
      'bookingId': 50,
      'garageId': 1,
      'status': 'ACCEPTED',
    },
    createdAt: DateTime(2026, 4, 19, 14, 30),
  );

  static final notification2 = AppNotification(
    id: 1002,
    userId: 12,
    title: 'New Message',
    message: 'You have a new message from Meseret Defar',
    type: 'MESSAGE',
    isRead: false,
    data: {
      'messageId': 5001,
      'senderId': 20,
      'conversationId': 200,
    },
    createdAt: DateTime(2026, 4, 19, 10, 45),
  );

  static final notification3 = AppNotification(
    id: 1003,
    userId: 12,
    title: 'Booking Completed',
    message: 'Your service at Piassa Auto Repair is completed',
    type: 'BOOKING',
    isRead: true,
    data: {
      'bookingId': 54,
      'garageId': 3,
      'status': 'COMPLETED',
    },
    createdAt: DateTime(2026, 4, 15, 16, 0),
  );

  static final notification4 = AppNotification(
    id: 1004,
    userId: 20,
    title: 'New Booking Request',
    message: 'New booking request from Abebe Bikila',
    type: 'BOOKING',
    isRead: false,
    data: {
      'bookingId': 50,
      'customerId': 12,
      'status': 'PENDING',
    },
    createdAt: DateTime(2026, 4, 18, 9, 15),
  );

  static final notification5 = AppNotification(
    id: 1005,
    userId: 30,
    title: 'Job Assigned',
    message: 'You have been assigned to a new job',
    type: 'JOB',
    isRead: false,
    data: {
      'bookingId': 51,
      'garageId': 4,
      'customerId': 12,
    },
    createdAt: DateTime(2026, 4, 19, 15, 20),
  );

  static final notification6 = AppNotification(
    id: 1006,
    userId: 40,
    title: 'New Part Request',
    message: 'Sara Tesfaye requested spark plugs',
    type: 'SPARE_PART_REQUEST',
    isRead: true,
    data: {
      'requestId': 801,
      'sparePartId': 103,
      'customerId': 13,
    },
    createdAt: DateTime(2026, 4, 18, 11, 30),
  );

  static final notification7 = AppNotification(
    id: 1007,
    userId: 13,
    title: 'Request Accepted',
    message: 'Your spare part request has been accepted',
    type: 'SPARE_PART_REQUEST',
    isRead: false,
    data: {
      'requestId': 801,
      'sparePartId': 103,
      'sellerId': 40,
      'status': 'ACCEPTED',
    },
    createdAt: DateTime(2026, 4, 19, 9, 45),
  );

  static final notification8 = AppNotification(
    id: 1008,
    userId: 12,
    title: 'Staff En Route',
    message: 'Kenenisa Bekele is on the way to your location',
    type: 'BOOKING',
    isRead: false,
    data: {
      'bookingId': 53,
      'staffId': 30,
      'status': 'EN_ROUTE',
    },
    createdAt: DateTime(2026, 4, 20, 14, 40),
  );

  // All notifications list
  static final allNotifications = [
    notification1,
    notification2,
    notification3,
    notification4,
    notification5,
    notification6,
    notification7,
    notification8,
  ];

  // Get notifications by user ID
  static List<AppNotification> getNotificationsByUser(int userId) {
    return allNotifications.where((notif) => notif.userId == userId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // Get unread notifications
  static List<AppNotification> getUnreadNotifications(int userId) {
    return allNotifications
        .where((notif) => notif.userId == userId && !notif.isRead)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // Get notifications by type
  static List<AppNotification> getNotificationsByType(int userId, String type) {
    return allNotifications
        .where((notif) => notif.userId == userId && notif.type == type)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // Get notification by ID
  static AppNotification? getNotificationById(int id) {
    try {
      return allNotifications.firstWhere((notif) => notif.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get unread count for user
  static int getUnreadCount(int userId) {
    return allNotifications
        .where((notif) => notif.userId == userId && !notif.isRead)
        .length;
  }
}
