import 'package:equatable/equatable.dart';
import 'package:qirb_garage/src/shared/enums/booking_status.dart';

/// Detailed booking entity with nested garage information
/// Based on GET /bookings/my response
class BookingDetail extends Equatable {
  final int id;
  final BookingGarage garage;
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

  const BookingDetail({
    required this.id,
    required this.garage,
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

  @override
  List<Object?> get props => [
        id,
        garage,
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

/// Nested garage information in booking response
class BookingGarage extends Equatable {
  final int? id;
  final String name;
  final String? phoneNumber;
  final String? address;

  const BookingGarage({
    this.id,
    required this.name,
    this.phoneNumber,
    this.address,
  });

  @override
  List<Object?> get props => [id, name, phoneNumber, address];
}
