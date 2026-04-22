/// API endpoint constants for Qirb Garage
/// Based on official API documentation
class ApiConstants {
  ApiConstants._();

  // ============================================================================
  // Module 1: Public Endpoints (No Token Required)
  // ============================================================================

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String registerSpareSeller = '/auth/register/spare-seller';
  static const String googleAuth = '/auth/google';
  static const String me = '/auth/me';

  // Public garage endpoints
  static const String garages = '/garages';
  static String garageById(int id) => '/garages/$id';
  static const String garagesNearby = '/garages/nearby';

  // Public spare parts endpoints
  static const String spareParts = '/spare-parts';
  static String sparePartById(int id) => '/spare-parts/$id';

  // Public manuals
  static const String manuals = '/manuals';

  // Lookup endpoints
  static const String lookupCities = '/lookups/cities';
  static const String lookupVehicleTypes = '/lookups/vehicle-types';
  static const String lookupServiceTypes = '/lookups/service-types';

  // Public reviews
  static String garageReviews(int garageId) => '/reviews/garage/$garageId';

  // ============================================================================
  // Module 2: Global Service Hooks (Authenticated - All Roles)
  // ============================================================================

  // Notifications
  static const String notificationsUnreadCounts =
      '/notifications/unread-counts';

  // Messaging
  static const String messagesConversations = '/messages/conversations';
  static String conversationMessages(String convoId) =>
      '/messages/$convoId/messages';
  static const String messagesSend = '/messages/send';
  static const String messagesInitiate = '/messages/initiate';

  // ============================================================================
  // Module 3: Customer Role Endpoints (User)
  // ============================================================================

  // Bookings
  static const String bookings = '/bookings';
  static const String myBookings = '/bookings/my';
  static String bookingStatus(int id) => '/bookings/$id/status';

  // Spare part requests
  static const String sparePartRequests = '/spare-part-requests';
  static const String mySparePartRequests = '/spare-part-requests/my';

  // Reviews
  static const String reviews = '/reviews';

  // Saved garages
  static const String savedGarages = '/saved-garages';

  // ============================================================================
  // Module 4: Garage Owner Role Endpoints (GarageOwner)
  // ============================================================================

  // Applications
  static const String applications = '/applications';
  static const String applicationsStatus = '/applications/status';

  // Garage owner dashboard
  static const String garageOwnerStats = '/garage-owner/stats';
  static const String garageOwnerBookings = '/garage-owner/bookings';
  static String garageOwnerBookingStatus(int id) =>
      '/garage-owner/bookings/$id/status';
  static String garageOwnerBookingAssign(int id) =>
      '/garage-owner/bookings/$id/assign';

  // Staff management
  static const String garageOwnerStaff = '/garage-owner/staff';

  // Services management
  static const String garageOwnerServices = '/garage-owner/services';
  static String garageOwnerServiceById(int id) => '/garage-owner/services/$id';

  // ============================================================================
  // Module 5: Workshop Staff Role Endpoints (Staff)
  // ============================================================================

  static const String staffDashboardJobs = '/staff-dashboard/jobs';
  static String staffJobStatus(int id) => '/staff-dashboard/jobs/$id/status';

  // ============================================================================
  // Module 6: Marketplace Seller Endpoints (SparePartSeller)
  // ============================================================================

  static const String mySpareParts = '/spare-parts/my';
  static String updateSparePart(int id) => '/spare-parts/$id';
  static const String sellerSpareRequests = '/spare-requests/seller';
  static String sellerSpareRequestStatus(int id) =>
      '/spare-requests/$id/status';
}
