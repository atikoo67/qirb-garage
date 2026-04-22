import 'package:equatable/equatable.dart';

/// Notification counts from /notifications/unread-counts
class NotificationCounts extends Equatable {
  final int unreadMessages;
  final int pendingBookings;

  const NotificationCounts({
    required this.unreadMessages,
    required this.pendingBookings,
  });

  int get totalCount => unreadMessages + pendingBookings;

  bool get hasUnread => totalCount > 0;

  @override
  List<Object?> get props => [unreadMessages, pendingBookings];
}
