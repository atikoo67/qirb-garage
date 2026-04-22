/// Central export file for all mock data
///
/// This file provides easy access to all mock data for testing and development.
/// All mock data is based on the official API documentation.
///
/// Usage:
/// ```dart
/// import 'package:qirb_garage/src/shared/mock_data/mock_data.dart';
///
/// // Get mock users
/// final customer = MockUsers.customer;
/// final garageOwner = MockUsers.garageOwner;
///
/// // Get mock garages
/// final nearbyGarages = MockGarages.getNearbyGarages();
///
/// // Get mock bookings
/// final myBookings = MockBookings.getBookingsByCustomer(12);
/// ```

export 'mock_users.dart';
export 'mock_garages.dart';
export 'mock_bookings.dart';
export 'mock_spare_parts.dart';
export 'mock_messages.dart';
export 'mock_lookups.dart';
export 'mock_garage_owner.dart';
export 'mock_notifications.dart';
