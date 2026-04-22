/// User roles in the Qirb Garage system
/// Based on API documentation
enum UserRole {
  user('User'), // Customer role in API
  garageOwner('GarageOwner'),
  staff('Staff'),
  sparePartSeller('SparePartSeller');

  const UserRole(this.value);

  final String value;

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => UserRole.user,
    );
  }

  // Helper getters
  bool get isCustomer => this == UserRole.user;
  bool get isGarageOwner => this == UserRole.garageOwner;
  bool get isStaff => this == UserRole.staff;
  bool get isSeller => this == UserRole.sparePartSeller;
}
