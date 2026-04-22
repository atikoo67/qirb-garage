import 'package:qirb_garage/src/features/booking/domain/entities/booking.dart';
import 'package:qirb_garage/src/features/booking/domain/entities/booking_detail.dart';
import 'package:qirb_garage/src/shared/enums/booking_status.dart';

/// Mock booking data based on API documentation
class MockBookings {
  MockBookings._();

  // Pending booking
  static final pendingBooking = Booking(
    id: 50,
    customerId: 12,
    garageId: 1,
    garageName: 'Bole Garage',
    vehicleInfo: 'Toyota Corolla 2022 White',
    scheduledAt: DateTime(2026, 5, 20, 10, 0),
    isOnSite: false,
    customerFeedback: 'Need oil change and general checkup',
    status: BookingStatus.pending,
    createdAt: DateTime(2026, 4, 18),
  );

  // Accepted booking with staff assigned
  static final acceptedBooking = Booking(
    id: 51,
    customerId: 12,
    garageId: 4,
    garageName: 'Reliable Auto Care',
    vehicleInfo: 'Toyota Vitz 2015 Silver',
    scheduledAt: DateTime(2026, 5, 25, 14, 0),
    isOnSite: true,
    locationLat: 9.02,
    locationLng: 38.75,
    locationAddress: 'Bole, Near Edna Mall',
    customerFeedback: 'Strange noise from front right wheel',
    status: BookingStatus.accepted,
    assignedStaffId: 30,
    assignedStaffName: 'Kenenisa Bekele',
    createdAt: DateTime(2026, 4, 19),
  );

  // In progress booking
  static final inProgressBooking = Booking(
    id: 52,
    customerId: 13,
    garageId: 2,
    garageName: 'Mercury Motors',
    vehicleInfo: 'BMW X5 2020 Black',
    scheduledAt: DateTime(2026, 4, 20, 9, 0),
    isOnSite: false,
    customerFeedback: 'Brake service needed',
    status: BookingStatus.inProgress,
    assignedStaffId: 30,
    assignedStaffName: 'Kenenisa Bekele',
    createdAt: DateTime(2026, 4, 15),
    updatedAt: DateTime(2026, 4, 20),
  );

  // En route booking (mobile mechanic)
  static final enRouteBooking = Booking(
    id: 53,
    customerId: 14,
    garageId: 1,
    garageName: 'Bole Garage',
    vehicleInfo: 'Nissan Patrol 2018 White',
    scheduledAt: DateTime(2026, 4, 20, 15, 0),
    isOnSite: true,
    locationLat: 9.05,
    locationLng: 38.78,
    locationAddress: 'Megenagna, Behind Total Station',
    customerFeedback: 'Car won\'t start, need mobile service',
    status: BookingStatus.enRoute,
    assignedStaffId: 30,
    assignedStaffName: 'Kenenisa Bekele',
    createdAt: DateTime(2026, 4, 20),
  );

  // Completed booking
  static final completedBooking = Booking(
    id: 54,
    customerId: 12,
    garageId: 3,
    garageName: 'Piassa Auto Repair',
    vehicleInfo: 'Honda Civic 2019 Blue',
    scheduledAt: DateTime(2026, 4, 15, 11, 0),
    isOnSite: false,
    customerFeedback: 'Tire replacement',
    status: BookingStatus.completed,
    assignedStaffId: 30,
    assignedStaffName: 'Kenenisa Bekele',
    createdAt: DateTime(2026, 4, 10),
    updatedAt: DateTime(2026, 4, 15),
  );

  // Cancelled booking
  static final cancelledBooking = Booking(
    id: 55,
    customerId: 13,
    garageId: 5,
    garageName: 'Kazanchis Service Center',
    vehicleInfo: 'Hyundai Tucson 2021 Red',
    scheduledAt: DateTime(2026, 4, 22, 10, 0),
    isOnSite: false,
    customerFeedback: 'AC repair',
    status: BookingStatus.cancelled,
    createdAt: DateTime(2026, 4, 18),
    updatedAt: DateTime(2026, 4, 19),
  );

  // Rejected booking
  static final rejectedBooking = Booking(
    id: 56,
    customerId: 14,
    garageId: 6,
    garageName: 'Gerji Auto Works',
    vehicleInfo: 'Mazda CX-5 2020 Gray',
    scheduledAt: DateTime(2026, 4, 25, 13, 0),
    isOnSite: false,
    customerFeedback: 'Engine diagnostics',
    status: BookingStatus.rejected,
    createdAt: DateTime(2026, 4, 19),
    updatedAt: DateTime(2026, 4, 19),
  );

  // Booking details with nested garage info
  static final bookingDetail1 = BookingDetail(
    id: 50,
    garage: const BookingGarage(
      id: 1,
      name: 'Bole Garage',
      phoneNumber: '+251911234567',
      address: 'Bole Road, Near Edna Mall',
    ),
    vehicleInfo: 'Toyota Corolla 2022 White',
    scheduledAt: DateTime(2026, 5, 20, 10, 0),
    isOnSite: false,
    customerFeedback: 'Need oil change and general checkup',
    status: BookingStatus.pending,
    customerName: 'Abebe Bikila',
    createdAt: DateTime(2026, 4, 18),
  );

  static final bookingDetail2 = BookingDetail(
    id: 51,
    garage: const BookingGarage(
      id: 4,
      name: 'Reliable Auto Care',
      phoneNumber: '+251922345678',
      address: 'Megenagna, Behind Total Station',
    ),
    vehicleInfo: 'Toyota Vitz 2015 Silver',
    scheduledAt: DateTime(2026, 5, 25, 14, 0),
    isOnSite: true,
    locationLat: 9.02,
    locationLng: 38.75,
    locationAddress: 'Bole, Near Edna Mall',
    customerFeedback: 'Strange noise from front right wheel',
    status: BookingStatus.accepted,
    assignedStaffId: 30,
    assignedStaffName: 'Kenenisa Bekele',
    customerName: 'Abebe Bikila',
    createdAt: DateTime(2026, 4, 19),
  );

  // All bookings list
  static final allBookings = [
    pendingBooking,
    acceptedBooking,
    inProgressBooking,
    enRouteBooking,
    completedBooking,
    cancelledBooking,
    rejectedBooking,
  ];

  static final allBookingDetails = [
    bookingDetail1,
    bookingDetail2,
  ];

  // Get bookings by customer ID
  static List<Booking> getBookingsByCustomer(int customerId) {
    return allBookings
        .where((booking) => booking.customerId == customerId)
        .toList();
  }

  // Get bookings by garage ID
  static List<Booking> getBookingsByGarage(int garageId) {
    return allBookings
        .where((booking) => booking.garageId == garageId)
        .toList();
  }

  // Get bookings by status
  static List<Booking> getBookingsByStatus(BookingStatus status) {
    return allBookings.where((booking) => booking.status == status).toList();
  }

  // Get active bookings
  static List<Booking> getActiveBookings() {
    return allBookings.where((booking) => booking.status.isActive).toList();
  }

  // Get booking by ID
  static Booking? getBookingById(int id) {
    try {
      return allBookings.firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get bookings by staff ID
  static List<Booking> getBookingsByStaff(int staffId) {
    return allBookings
        .where((booking) => booking.assignedStaffId == staffId)
        .toList();
  }
}
