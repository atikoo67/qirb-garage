/// Create spare part request DTO
class CreateSparePartRequest {
  final String name;
  final double price;
  final String category;
  final String vehicleModel;
  final String condition;
  final String? description;

  const CreateSparePartRequest({
    required this.name,
    required this.price,
    required this.category,
    required this.vehicleModel,
    required this.condition,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'name': name,
      'price': price,
      'category': category,
      'vehicleModel': vehicleModel,
      'condition': condition,
    };

    if (description != null) {
      json['description'] = description;
    }

    return json;
  }
}

/// Create spare part inquiry request DTO
class CreateSparePartInquiryRequest {
  final int spareId;
  final int quantity;
  final String? notes;

  const CreateSparePartInquiryRequest({
    required this.spareId,
    this.quantity = 1,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'spareId': spareId,
      'quantity': quantity,
    };

    if (notes != null) {
      json['notes'] = notes;
    }

    return json;
  }
}
