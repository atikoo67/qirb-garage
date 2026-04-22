import 'package:equatable/equatable.dart';
import 'package:qirb_garage/src/shared/enums/booking_status.dart';

/// Booking entity representing a service booking
/// Based on API request/response structure
class Booking extends Equatable {
  final int id;
  final int customerId;
  final int garageId;
  final String? garageName;
  final String vehicleInfo;
  final DateTime scheduledAt;
  final bool isOnSite;
  final double? locationLat;
  final double? locationLng;
  final String? locationAddress;
  final String? customerFeedback;
  final BookingStatus status;
  final int? assignedStaffId;
  final String? assignedStaffName;
  final String? customerName;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Booking({
    required this.id,
    required this.customerId,
    required this.garageId,
    this.garageName,
    required this.vehicleInfo,
    required this.scheduledAt,
    required this.isOnSite,
    this.locationLat,
    this.locationLng,
    this.locationAddress,
    this.customerFeedback,
    required this.status,
    this.assignedStaffId,
    this.assignedStaffName,
    this.customerName,
    required this.createdAt,
    this.updatedAt,
  });

  /// Check if this is a mobile mechanic service
  bool get isMobileMechanic => isOnSite;

  /// Check if location is required
  bool get requiresLocation => isOnSite;

  @override
  List<Object?> get props => [
        id,
        customerId,
        garageId,
        garageName,
        vehicleInfo,
        scheduledAt,
        isOnSite,
        locationLat,
        locationLng,
        locationAddress,
        customerFeedback,
        status,
        assignedStaffId,
        assignedStaffName,
        customerName,
        createdAt,
        updatedAt,
      ];
}
