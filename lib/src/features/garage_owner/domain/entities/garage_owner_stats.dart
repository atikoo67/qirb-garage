import 'package:equatable/equatable.dart';

/// Garage owner dashboard statistics
/// Based on /garage-owner/stats response
class GarageOwnerStats extends Equatable {
  final int totalBookings;
  final double totalRevenue;
  final int activeStaff;
  final int pendingRequests;
  final String revenueCurrency;

  const GarageOwnerStats({
    required this.totalBookings,
    required this.totalRevenue,
    required this.activeStaff,
    required this.pendingRequests,
    required this.revenueCurrency,
  });

  String get formattedRevenue {
    return '$revenueCurrency ${totalRevenue.toStringAsFixed(2)}';
  }

  @override
  List<Object?> get props => [
        totalBookings,
        totalRevenue,
        activeStaff,
        pendingRequests,
        revenueCurrency,
      ];
}
