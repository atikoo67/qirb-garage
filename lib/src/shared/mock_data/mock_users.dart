import 'package:qirb_garage/src/features/auth/domain/entities/user.dart';
import 'package:qirb_garage/src/shared/enums/user_role.dart';
import 'package:qirb_garage/src/shared/enums/application_status.dart';

/// Mock user data based on API documentation
class MockUsers {
  MockUsers._();

  // Customer user
  static final customer = AppUser(
    id: 12,
    fullName: 'Abebe Bikila',
    email: 'customer@qirb.com',
    phoneNumber: '+251911223344',
    role: UserRole.user,
    applicationStatus: null,
    createdAt: DateTime(2026, 1, 15),
  );

  // Garage owner with approved application
  static final garageOwner = AppUser(
    id: 20,
    fullName: 'Meseret Defar',
    email: 'owner@qirb.com',
    phoneNumber: '+251922334455',
    role: UserRole.garageOwner,
    applicationStatus: ApplicationStatus.approved,
    createdAt: DateTime(2026, 2, 1),
  );

  // Garage owner with pending application
  static final garageOwnerPending = AppUser(
    id: 21,
    fullName: 'Haile Gebrselassie',
    email: 'owner2@qirb.com',
    phoneNumber: '+251933445566',
    role: UserRole.garageOwner,
    applicationStatus: ApplicationStatus.pending,
    createdAt: DateTime(2026, 4, 10),
  );

  // Staff member
  static final staff = AppUser(
    id: 30,
    fullName: 'Kenenisa Bekele',
    email: 'staff@qirb.com',
    phoneNumber: '+251944556677',
    role: UserRole.staff,
    applicationStatus: null,
    createdAt: DateTime(2026, 2, 15),
  );

  // Spare part seller
  static final seller = AppUser(
    id: 40,
    fullName: 'Samuel Parts',
    email: 'sam@parts.com',
    phoneNumber: '+251955667788',
    role: UserRole.sparePartSeller,
    applicationStatus: ApplicationStatus.approved,
    createdAt: DateTime(2026, 3, 1),
  );

  // Additional customers
  static final customer2 = AppUser(
    id: 13,
    fullName: 'Sara Tesfaye',
    email: 'sara@example.com',
    phoneNumber: '+251912345678',
    role: UserRole.user,
    applicationStatus: null,
    createdAt: DateTime(2026, 3, 20),
  );

  static final customer3 = AppUser(
    id: 14,
    fullName: 'Dawit Alemayehu',
    email: 'dawit@example.com',
    phoneNumber: '+251923456789',
    role: UserRole.user,
    applicationStatus: null,
    createdAt: DateTime(2026, 4, 5),
  );

  // All users list
  static final allUsers = [
    customer,
    customer2,
    customer3,
    garageOwner,
    garageOwnerPending,
    staff,
    seller,
  ];

  // Get user by role
  static List<AppUser> getUsersByRole(UserRole role) {
    return allUsers.where((user) => user.role == role).toList();
  }

  // Get user by ID
  static AppUser? getUserById(int id) {
    try {
      return allUsers.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }
}
