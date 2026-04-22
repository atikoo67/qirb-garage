/// Feature Flags Configuration
///
/// This file controls which features use mock data vs real backend.
/// Change these flags to switch between mock and real implementations.
///
/// IMPORTANT: Set all flags to false before production deployment!
class FeatureFlags {
  FeatureFlags._();

  /// Use mock authentication instead of real backend
  ///
  /// When true: Uses MockAuthService with predefined test users
  /// When false: Uses real AuthService with backend API
  ///
  /// Mock Test Users:
  /// - user@test.com / password123 (Regular User)
  /// - admin@test.com / admin123 (Admin)
  /// - owner@test.com / owner123 (Garage Owner)
  static const bool useMockAuth = true;

  /// Use mock garage data instead of real backend
  ///
  /// When true: Uses mock garage list
  /// When false: Uses real garage API
  static const bool useMockGarages = true;

  /// Use mock booking data instead of real backend
  ///
  /// When true: Uses mock booking list
  /// When false: Uses real booking API
  static const bool useMockBookings = true;

  /// Use mock profile data instead of real backend
  ///
  /// When true: Uses mock profile data
  /// When false: Uses real profile API
  static const bool useMockProfile = true;

  /// Enable debug logging
  static const bool enableDebugLogging = true;

  /// Simulate network delays (in milliseconds)
  /// Set to 0 to disable delays
  static const int mockNetworkDelay = 1500;

  /// Check if any mock feature is enabled
  static bool get isAnyMockEnabled =>
      useMockAuth || useMockGarages || useMockBookings || useMockProfile;

  /// Check if all features are using real backend
  static bool get isProductionReady => !isAnyMockEnabled;

  /// Get a summary of current configuration
  static String get configSummary => '''
Feature Flags Configuration:
  - Mock Auth: ${useMockAuth ? 'ENABLED' : 'DISABLED'}
  - Mock Garages: ${useMockGarages ? 'ENABLED' : 'DISABLED'}
  - Mock Bookings: ${useMockBookings ? 'ENABLED' : 'DISABLED'}
  - Mock Profile: ${useMockProfile ? 'ENABLED' : 'DISABLED'}
  - Debug Logging: ${enableDebugLogging ? 'ENABLED' : 'DISABLED'}
  - Network Delay: ${mockNetworkDelay}ms
  - Production Ready: ${isProductionReady ? 'YES' : 'NO'}
''';
}
