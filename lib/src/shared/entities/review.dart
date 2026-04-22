import 'package:equatable/equatable.dart';

/// Review entity for garage reviews
class Review extends Equatable {
  final int id;
  final int garageId;
  final int? bookingId;
  final int customerId;
  final String? customerName;
  final int rating; // 1-5
  final String comment;
  final DateTime createdAt;

  const Review({
    required this.id,
    required this.garageId,
    this.bookingId,
    required this.customerId,
    this.customerName,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        garageId,
        bookingId,
        customerId,
        customerName,
        rating,
        comment,
        createdAt,
      ];
}
