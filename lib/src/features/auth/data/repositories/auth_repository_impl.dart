import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';

import 'package:qirb_garage/src/features/auth/domain/entities/user.dart';
import 'package:qirb_garage/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:qirb_garage/src/shared/enums/user_role.dart';
import 'package:qirb_garage/src/shared/enums/application_status.dart';

class AuthRepositoryImpl implements AuthRepository {
  // Uses factory to get either mock or real auth service based on feature flags
  final dynamic _authService = AuthServiceFactory.instance;

  @override
  Stream<AppUser?> get onAuthStateChanged {
    return _authService.authStateChanges.map<AppUser?>((userData) {
      if (userData == null) return null;
      return AppUser(
        id: userData['id'] as int? ?? 0,
        fullName: userData['fullName'] as String? ?? '',
        email: userData['email'] as String? ?? '',
        phoneNumber: userData['phoneNumber'] as String? ?? '',
        role: UserRole.fromString(userData['role'] as String? ?? 'User'),
        applicationStatus: userData['applicationStatus'] != null
            ? ApplicationStatus.fromString(
                userData['applicationStatus'] as String)
            : null,
        photoUrl: userData['photoUrl'] as String?,
      );
    });
  }

  @override
  FutureEither<AppUser> login({
    required String email,
    required String password,
  }) async {
    final result = await _authService.login(email: email, password: password);

    return result.flatMap<AppUser>((userData) {
      if (userData == null) {
        return left<Failure, AppUser>(
            const ServerFailure('Login failed: User record not found'));
      }

      final data = userData['user'] ?? userData;
      final user = AppUser(
        id: data['id'] as int? ?? 0,
        fullName: data['fullName'] as String? ?? '',
        email: data['email'] as String? ?? email,
        phoneNumber: data['phoneNumber'] as String? ?? '',
        role: UserRole.fromString(data['role'] as String? ?? 'User'),
        applicationStatus: data['applicationStatus'] != null
            ? ApplicationStatus.fromString(data['applicationStatus'] as String)
            : null,
        photoUrl: data['photoUrl'] as String?,
      );

      return right<Failure, AppUser>(user);
    });
  }

  @override
  FutureEither<AppUser> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await _authService.signUp(
      name: name,
      email: email,
      password: password,
    );

    return result.flatMap<AppUser>((userData) {
      if (userData == null) {
        return left<Failure, AppUser>(
            const ServerFailure('Sign up failed: User record corrupted'));
      }

      final data = userData['user'] ?? userData;
      final user = AppUser(
        id: data['id'] as int? ?? 0,
        fullName: data['fullName'] as String? ?? name,
        email: data['email'] as String? ?? email,
        phoneNumber: data['phoneNumber'] as String? ?? '',
        role: UserRole.fromString(data['role'] as String? ?? 'User'),
        applicationStatus: data['applicationStatus'] != null
            ? ApplicationStatus.fromString(data['applicationStatus'] as String)
            : null,
        photoUrl: data['photoUrl'] as String?,
      );

      return right<Failure, AppUser>(user);
    });
  }

  @override
  FutureEither<void> forgotPassword({required String email}) {
    return _authService.forgotPassword(email: email);
  }

  @override
  FutureEither<void> logout() {
    return _authService.logout();
  }

  @override
  FutureEither<AppUser?> checkAuthState() async {
    final result = await _authService.getCurrentUser();

    return result.map<AppUser?>((userData) {
      if (userData == null) return null;

      return AppUser(
        id: userData['id'] as int? ?? 0,
        fullName: userData['fullName'] as String? ?? '',
        email: userData['email'] as String? ?? '',
        phoneNumber: userData['phoneNumber'] as String? ?? '',
        role: UserRole.fromString(userData['role'] as String? ?? 'User'),
        applicationStatus: userData['applicationStatus'] != null
            ? ApplicationStatus.fromString(
                userData['applicationStatus'] as String)
            : null,
        photoUrl: userData['photoUrl'] as String?,
      );
    });
  }
}
