import 'package:qirb_garage/src/features/garage_owner/domain/entities/garage_owner_stats.dart';
import 'package:qirb_garage/src/features/garage_owner/domain/entities/staff.dart';
import 'package:qirb_garage/src/features/garage_owner/domain/entities/application.dart';
import 'package:qirb_garage/src/shared/enums/application_status.dart';

/// Mock garage owner data based on API documentation
class MockGarageOwner {
  MockGarageOwner._();

  // Dashboard statistics
  static final stats = GarageOwnerStats(
    totalBookings: 154,
    totalRevenue: 450000.50,
    activeStaff: 8,
    pendingRequests: 5,
    revenueCurrency: 'ETB',
  );

  static final stats2 = GarageOwnerStats(
    totalBookings: 89,
    totalRevenue: 275000.00,
    activeStaff: 5,
    pendingRequests: 3,
    revenueCurrency: 'ETB',
  );

  // Staff members
  static final staff1 = Staff(
    id: 30,
    fullName: 'Kenenisa Bekele',
    email: 'staff@qirb.com',
    specialization: 'Engine Specialist',
    garageId: 1,
    isActive: true,
    createdAt: DateTime(2026, 2, 15),
  );

  static final staff2 = Staff(
    id: 31,
    fullName: 'Tirunesh Dibaba',
    email: 'tirunesh@bolegarage.com',
    specialization: 'Electrician',
    garageId: 1,
    isActive: true,
    createdAt: DateTime(2026, 2, 20),
  );

  static final staff3 = Staff(
    id: 32,
    fullName: 'Derartu Tulu',
    email: 'derartu@bolegarage.com',
    specialization: 'Brake Specialist',
    garageId: 1,
    isActive: true,
    createdAt: DateTime(2026, 3, 1),
  );

  static final staff4 = Staff(
    id: 33,
    fullName: 'Feyisa Lilesa',
    email: 'feyisa@bolegarage.com',
    specialization: 'General Mechanic',
    garageId: 1,
    isActive: true,
    createdAt: DateTime(2026, 3, 10),
  );

  static final staff5 = Staff(
    id: 34,
    fullName: 'Almaz Ayana',
    email: 'almaz@bolegarage.com',
    specialization: 'AC Specialist',
    garageId: 1,
    isActive: true,
    createdAt: DateTime(2026, 3, 15),
  );

  static final staff6 = Staff(
    id: 35,
    fullName: 'Genzebe Dibaba',
    email: 'genzebe@reliableauto.com',
    specialization: 'Transmission Specialist',
    garageId: 4,
    isActive: true,
    createdAt: DateTime(2026, 2, 25),
  );

  static final staff7 = Staff(
    id: 36,
    fullName: 'Lelisa Desisa',
    email: 'lelisa@reliableauto.com',
    specialization: 'Body Work',
    garageId: 4,
    isActive: true,
    createdAt: DateTime(2026, 3, 5),
  );

  static final staff8 = Staff(
    id: 37,
    fullName: 'Tiki Gelana',
    email: 'tiki@reliableauto.com',
    specialization: 'Tire Specialist',
    garageId: 4,
    isActive: false,
    createdAt: DateTime(2026, 1, 20),
  );

  // Applications
  static final approvedApplication = Application(
    id: 10,
    businessName: 'Bole Garage',
    city: 'Addis Ababa',
    status: ApplicationStatus.approved,
    businessLicenseUrl: '/uploads/applications/license-10.pdf',
    ownerIdDocumentUrl: '/uploads/applications/id-10.pdf',
    createdAt: DateTime(2026, 1, 10),
    updatedAt: DateTime(2026, 1, 15),
  );

  static final pendingApplication = Application(
    id: 11,
    businessName: 'Kazanchis Service Center',
    city: 'Addis Ababa',
    status: ApplicationStatus.pending,
    businessLicenseUrl: '/uploads/applications/license-11.pdf',
    ownerIdDocumentUrl: '/uploads/applications/id-11.pdf',
    createdAt: DateTime(2026, 4, 10),
  );

  static final rejectedApplication = Application(
    id: 12,
    businessName: 'Quick Fix Auto',
    city: 'Addis Ababa',
    status: ApplicationStatus.rejected,
    businessLicenseUrl: '/uploads/applications/license-12.pdf',
    ownerIdDocumentUrl: '/uploads/applications/id-12.pdf',
    rejectionReason:
        'Incomplete documentation. Please resubmit with valid business license.',
    createdAt: DateTime(2026, 3, 25),
    updatedAt: DateTime(2026, 3, 30),
  );

  // All staff list
  static final allStaff = [
    staff1,
    staff2,
    staff3,
    staff4,
    staff5,
    staff6,
    staff7,
    staff8,
  ];

  static final allApplications = [
    approvedApplication,
    pendingApplication,
    rejectedApplication,
  ];

  // Get staff by garage ID
  static List<Staff> getStaffByGarage(int garageId) {
    return allStaff.where((staff) => staff.garageId == garageId).toList();
  }

  // Get active staff only
  static List<Staff> getActiveStaff() {
    return allStaff.where((staff) => staff.isActive == true).toList();
  }

  // Get staff by ID
  static Staff? getStaffById(int id) {
    try {
      return allStaff.firstWhere((staff) => staff.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get staff by specialization
  static List<Staff> getStaffBySpecialization(String specialization) {
    return allStaff
        .where((staff) =>
            staff.specialization.toLowerCase() == specialization.toLowerCase())
        .toList();
  }

  // Get application by ID
  static Application? getApplicationById(int id) {
    try {
      return allApplications.firstWhere((app) => app.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get applications by status
  static List<Application> getApplicationsByStatus(ApplicationStatus status) {
    return allApplications.where((app) => app.status == status).toList();
  }
}
