import 'package:equatable/equatable.dart';
import 'package:qirb_garage/src/shared/enums/user_role.dart';
import 'package:qirb_garage/src/shared/enums/application_status.dart';

/// User entity based on API /auth/login and /auth/me response
class AppUser extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final UserRole role;
  final ApplicationStatus? applicationStatus;
  final String? photoUrl;
  final DateTime? createdAt;

  const AppUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.role,
    this.applicationStatus,
    this.photoUrl,
    this.createdAt,
  });

  factory AppUser.empty() => const AppUser(
        id: 0,
        fullName: '',
        email: '',
        phoneNumber: '',
        role: UserRole.user,
      );

  bool get isEmpty => id == 0;
  bool get isNotEmpty => id != 0;

  // Role checks
  bool get isCustomer => role.isCustomer;
  bool get isGarageOwner => role.isGarageOwner;
  bool get isStaff => role.isStaff;
  bool get isSeller => role.isSeller;

  // Application status checks
  bool get isApplicationApproved =>
      applicationStatus == ApplicationStatus.approved;
  bool get isApplicationPending =>
      applicationStatus == ApplicationStatus.pending;
  bool get isApplicationRejected =>
      applicationStatus == ApplicationStatus.rejected;

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        phoneNumber,
        role,
        applicationStatus,
        photoUrl,
        createdAt,
      ];
}
