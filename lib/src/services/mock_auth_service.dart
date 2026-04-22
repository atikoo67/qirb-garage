import 'dart:async';
import '../utils/utils.dart';

/// Mock Authentication Service
///
/// This service simulates backend authentication for development/testing.
/// Replace this with the real AuthService when backend is ready.
///
/// Mock Users:
/// - Email: user@test.com, Password: password123
/// - Email: admin@test.com, Password: admin123
/// - Email: owner@test.com, Password: owner123
class MockAuthService {
  MockAuthService._();
  static final MockAuthService instance = MockAuthService._();

  // Simulated delay for network requests (in milliseconds)
  static const int _networkDelay = 1500;

  // Mock user database
  static final List<Map<String, dynamic>> _mockUsers = [
    {
      'id': 1,
      'fullName': 'John Doe',
      'email': 'user@test.com',
      'password': 'password123',
      'phoneNumber': '+1234567890',
      'role': 'User',
      'applicationStatus': null,
      'photoUrl': null,
    },
    {
      'id': 2,
      'fullName': 'Admin User',
      'email': 'admin@test.com',
      'password': 'admin123',
      'phoneNumber': '+1234567891',
      'role': 'Admin',
      'applicationStatus': null,
      'photoUrl': null,
    },
    {
      'id': 3,
      'fullName': 'Garage Owner',
      'email': 'owner@test.com',
      'password': 'owner123',
      'phoneNumber': '+1234567892',
      'role': 'GarageOwner',
      'applicationStatus': 'Approved',
      'photoUrl': null,
    },
  ];

  // Current authenticated user
  Map<String, dynamic>? _currentUser;

  // Auth state stream controller
  final StreamController<Map<String, dynamic>?> _authStateController =
      StreamController<Map<String, dynamic>?>.broadcast();

  /// Stream of auth state changes. Emits the current user map or null.
  Stream<Map<String, dynamic>?> get authStateChanges =>
      _authStateController.stream;

  /// Mock login - simulates API call with delay
  FutureEither<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    return runTask(() async {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: _networkDelay));

      // Find user by email
      final user = _mockUsers.firstWhere(
        (u) => u['email'] == email,
        orElse: () => {},
      );

      // Check if user exists
      if (user.isEmpty) {
        throw Exception('Invalid email or password');
      }

      // Check password
      if (user['password'] != password) {
        throw Exception('Invalid email or password');
      }

      // Remove password from response
      final userData = Map<String, dynamic>.from(user);
      userData.remove('password');

      // Set current user
      _currentUser = userData;
      _authStateController.add(userData);

      return {'user': userData};
    }, requiresNetwork: false); // Mock doesn't require network
  }

  /// Mock sign up - simulates API call with delay
  FutureEither<Map<String, dynamic>?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return runTask(() async {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: _networkDelay));

      // Check if email already exists
      final existingUser = _mockUsers.firstWhere(
        (u) => u['email'] == email,
        orElse: () => {},
      );

      if (existingUser.isNotEmpty) {
        throw Exception('Email already exists');
      }

      // Create new user
      final newUser = {
        'id': _mockUsers.length + 1,
        'fullName': name,
        'email': email,
        'password': password,
        'phoneNumber': '',
        'role': 'User',
        'applicationStatus': null,
        'photoUrl': null,
      };

      // Add to mock database
      _mockUsers.add(newUser);

      // Remove password from response
      final userData = Map<String, dynamic>.from(newUser);
      userData.remove('password');

      // Set current user
      _currentUser = userData;
      _authStateController.add(userData);

      return {'user': userData};
    }, requiresNetwork: false);
  }

  /// Mock forgot password - simulates API call with delay
  FutureEither<void> forgotPassword({required String email}) async {
    return runTask(() async {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: _networkDelay));

      // Check if email exists
      final user = _mockUsers.firstWhere(
        (u) => u['email'] == email,
        orElse: () => {},
      );

      if (user.isEmpty) {
        throw Exception('Email not found');
      }

      // In real implementation, this would send an email
      // For mock, we just simulate success
      return;
    }, requiresNetwork: false);
  }

  /// Mock logout - simulates API call with delay
  FutureEither<void> logout() async {
    return runTask(() async {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Clear current user
      _currentUser = null;
      _authStateController.add(null);

      return;
    }, requiresNetwork: false);
  }

  /// Mock get current user - simulates API call with delay
  FutureEither<Map<String, dynamic>?> getCurrentUser() async {
    return runTask(() async {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      return _currentUser;
    }, requiresNetwork: false);
  }

  /// Check if user is authenticated
  bool get isAuthenticated => _currentUser != null;

  /// Get current user synchronously
  Map<String, dynamic>? get currentUser => _currentUser;

  /// Dispose resources
  void dispose() {
    _authStateController.close();
  }

  /// Reset mock data (useful for testing)
  void reset() {
    _currentUser = null;
    _authStateController.add(null);
  }
}
