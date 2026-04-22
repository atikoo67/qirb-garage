import 'package:equatable/equatable.dart';
import 'package:qirb_garage/src/shared/enums/spare_part_condition.dart';

/// Spare part entity
class SparePart extends Equatable {
  final int id;
  final int sellerId;
  final String sellerName;
  final String name;
  final String description;
  final String referenceNumber;
  final String category;
  final SparePartCondition condition;
  final double price;
  final String currency;
  final List<String> compatibleVehicles;
  final int stockQuantity;
  final List<String> imageUrls;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SparePart({
    required this.id,
    required this.sellerId,
    required this.sellerName,
    required this.name,
    required this.description,
    required this.referenceNumber,
    required this.category,
    required this.condition,
    required this.price,
    required this.currency,
    required this.compatibleVehicles,
    required this.stockQuantity,
    required this.imageUrls,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isInStock => stockQuantity > 0;

  @override
  List<Object?> get props => [
        id,
        sellerId,
        sellerName,
        name,
        description,
        referenceNumber,
        category,
        condition,
        price,
        currency,
        compatibleVehicles,
        stockQuantity,
        imageUrls,
        createdAt,
        updatedAt,
      ];
}
