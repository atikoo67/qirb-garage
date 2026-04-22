/// Create staff request DTO
class CreateStaffRequest {
  final String fullName;
  final String email;
  final String specialization;
  final String password;

  const CreateStaffRequest({
    required this.fullName,
    required this.email,
    required this.specialization,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'specialization': specialization,
      'password': password,
    };
  }
}

/// Assign staff request DTO
class AssignStaffRequest {
  final int staffId;

  const AssignStaffRequest({
    required this.staffId,
  });

  Map<String, dynamic> toJson() {
    return {
      'staffId': staffId,
    };
  }
}
