/// Create application request DTO
class CreateApplicationRequest {
  final String businessName;
  final String city;
  // Files will be handled separately in multipart request
  // businessLicense and ownerIdDocument

  const CreateApplicationRequest({
    required this.businessName,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'city': city,
    };
  }
}
