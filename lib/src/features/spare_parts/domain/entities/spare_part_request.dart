import 'package:equatable/equatable.dart';

/// Spare part request entity
class SparePartRequest extends Equatable {
  final int id;
  final int spareId;
  final int customerId;
  final String? customerName;
  final int quantity;
  final String? notes;
  final String status; // PENDING, ACCEPTED, REJECTED
  final DateTime createdAt;
  final DateTime? updatedAt;

  const SparePartRequest({
    required this.id,
    required this.spareId,
    required this.customerId,
    this.customerName,
    required this.quantity,
    this.notes,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  bool get isPending => status == 'PENDING';
  bool get isAccepted => status == 'ACCEPTED';
  bool get isRejected => status == 'REJECTED';

  @override
  List<Object?> get props => [
        id,
        spareId,
        customerId,
        customerName,
        quantity,
        notes,
        status,
        createdAt,
        updatedAt,
      ];
}
