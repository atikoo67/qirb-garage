/// Booking status in the system
/// Based on API documentation
enum BookingStatus {
  pending('PENDING'),
  accepted('ACCEPTED'),
  rejected('REJECTED'),
  inProgress('IN_PROGRESS'),
  enRoute('EN_ROUTE'), // For mobile mechanics
  completed('COMPLETED'),
  cancelled('CANCELLED');

  const BookingStatus(this.value);

  final String value;

  static BookingStatus fromString(String value) {
    return BookingStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => BookingStatus.pending,
    );
  }

  bool get isPending => this == BookingStatus.pending;
  bool get isAccepted => this == BookingStatus.accepted;
  bool get isRejected => this == BookingStatus.rejected;
  bool get isInProgress => this == BookingStatus.inProgress;
  bool get isEnRoute => this == BookingStatus.enRoute;
  bool get isCompleted => this == BookingStatus.completed;
  bool get isCancelled => this == BookingStatus.cancelled;

  bool get isActive =>
      this == BookingStatus.accepted ||
      this == BookingStatus.inProgress ||
      this == BookingStatus.enRoute;
}
