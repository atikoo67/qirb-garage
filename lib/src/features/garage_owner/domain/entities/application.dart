import 'package:equatable/equatable.dart';
import 'package:qirb_garage/src/shared/enums/application_status.dart';

/// Garage owner application entity
class Application extends Equatable {
  final int id;
  final String businessName;
  final String city;
  final ApplicationStatus status;
  final String? businessLicenseUrl;
  final String? ownerIdDocumentUrl;
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Application({
    required this.id,
    required this.businessName,
    required this.city,
    required this.status,
    this.businessLicenseUrl,
    this.ownerIdDocumentUrl,
    this.rejectionReason,
    required this.createdAt,
    this.updatedAt,
  });

  bool get isPending => status.isPending;
  bool get isApproved => status.isApproved;
  bool get isRejected => status.isRejected;

  @override
  List<Object?> get props => [
        id,
        businessName,
        city,
        status,
        businessLicenseUrl,
        ownerIdDocumentUrl,
        rejectionReason,
        createdAt,
        updatedAt,
      ];
}
