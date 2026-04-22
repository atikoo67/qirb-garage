import '../config/feature_flags.dart';
import 'auth_service.dart';
import 'mock_auth_service.dart';

/// Factory to provide the appropriate auth service based on feature flags
///
/// This allows easy switching between mock and real authentication.
/// Change FeatureFlags.useMockAuth to switch implementations.
class AuthServiceFactory {
  AuthServiceFactory._();

  /// Get the appropriate auth service based on feature flags
  static dynamic get instance {
    if (FeatureFlags.useMockAuth) {
      return MockAuthService.instance;
    } else {
      return AuthService.instance;
    }
  }

  /// Check if using mock service
  static bool get isMock => FeatureFlags.useMockAuth;

  /// Get service type name
  static String get serviceType => isMock ? 'Mock' : 'Real';
}
