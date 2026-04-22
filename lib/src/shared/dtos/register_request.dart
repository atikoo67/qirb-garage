/// Customer registration request DTO
class RegisterRequest {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;

  const RegisterRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.role = 'User',
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }
}

/// Spare seller registration request DTO
class RegisterSpareSellerRequest {
  final String fullName;
  final String shopName;
  final String email;
  final String password;
  final String city;
  final String phoneNumber;
  // Files will be handled separately in multipart request
  // verificationDoc and shopPhotos

  const RegisterSpareSellerRequest({
    required this.fullName,
    required this.shopName,
    required this.email,
    required this.password,
    required this.city,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'shopName': shopName,
      'email': email,
      'password': password,
      'city': city,
      'phoneNumber': phoneNumber,
    };
  }
}
