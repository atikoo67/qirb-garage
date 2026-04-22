/// Create booking request DTO
class CreateBookingRequest {
  final int garageId;
  final String vehicleInfo;
  final DateTime scheduledAt;
  final bool isOnSite;
  final double? locationLat;
  final double? locationLng;
  final String? locationAddress;
  final String? customerFeedback;

  const CreateBookingRequest({
    required this.garageId,
    required this.vehicleInfo,
    required this.scheduledAt,
    required this.isOnSite,
    this.locationLat,
    this.locationLng,
    this.locationAddress,
    this.customerFeedback,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'garageId': garageId,
      'vehicleInfo': vehicleInfo,
      'scheduledAt': scheduledAt.toIso8601String(),
      'isOnSite': isOnSite,
    };

    // Only include location fields if on-site service
    if (isOnSite) {
      if (locationLat != null) json['locationLat'] = locationLat;
      if (locationLng != null) json['locationLng'] = locationLng;
      if (locationAddress != null) json['locationAddress'] = locationAddress;
    }

    if (customerFeedback != null) {
      json['customerFeedback'] = customerFeedback;
    }

    return json;
  }
}

/// Update booking status request DTO
class UpdateBookingStatusRequest {
  final String status;

  const UpdateBookingStatusRequest({
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
    };
  }
}
