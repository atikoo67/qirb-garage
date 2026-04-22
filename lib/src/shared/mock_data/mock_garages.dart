import 'package:qirb_garage/src/features/garage/domain/entities/garage.dart';

/// Mock garage data based on API documentation
class MockGarages {
  MockGarages._();

  static final boleGarage = Garage(
    id: 1,
    name: 'Bole Garage',
    rating: '4.8',
    address: const GarageAddress(
      streetAddress: 'Bole Road, Near Edna Mall',
      city: 'Addis Ababa',
      region: 'Addis Ababa',
    ),
    distanceKm: 1.2,
    distanceLabel: '1.2 km',
    description:
        'Professional auto repair and maintenance services. Specializing in Toyota, Nissan, and Honda vehicles.',
    phoneNumber: '+251911234567',
    email: 'info@bolegarage.com',
    specialties: ['Engine Repair', 'Oil Change', 'Brake Service', 'Electrical'],
    isVerified: true,
    imageUrl: '/uploads/garages/bole-garage.jpg',
    createdAt: DateTime(2025, 6, 1),
    updatedAt: DateTime(2026, 4, 15),
  );

  static final reliableAutoCare = Garage(
    id: 4,
    name: 'Reliable Auto Care',
    rating: '4.7',
    address: const GarageAddress(
      streetAddress: 'Megenagna, Behind Total Station',
      city: 'Addis Ababa',
      region: 'Addis Ababa',
    ),
    distanceKm: 2.5,
    distanceLabel: '2.5 km',
    description:
        'Trusted auto care center with experienced mechanics. We handle all makes and models.',
    phoneNumber: '+251922345678',
    email: 'contact@reliableauto.com',
    specialties: ['Transmission', 'AC Repair', 'Tire Service', 'Body Work'],
    isVerified: true,
    imageUrl: '/uploads/garages/reliable-auto.jpg',
    createdAt: DateTime(2025, 8, 15),
    updatedAt: DateTime(2026, 4, 10),
  );

  static final mercuryMotors = Garage(
    id: 2,
    name: 'Mercury Motors',
    rating: '4.9',
    address: const GarageAddress(
      streetAddress: 'Mexico Square, Next to Sheraton',
      city: 'Addis Ababa',
      region: 'Addis Ababa',
    ),
    distanceKm: 3.8,
    distanceLabel: '3.8 km',
    description:
        'Premium auto service center specializing in luxury vehicles. Mercedes, BMW, Audi experts.',
    phoneNumber: '+251933456789',
    email: 'service@mercurymotors.com',
    specialties: [
      'Luxury Cars',
      'Diagnostics',
      'Performance Tuning',
      'Detailing'
    ],
    isVerified: true,
    imageUrl: '/uploads/garages/mercury-motors.jpg',
    createdAt: DateTime(2025, 9, 1),
    updatedAt: DateTime(2026, 4, 18),
  );

  static final piassaAutoRepair = Garage(
    id: 3,
    name: 'Piassa Auto Repair',
    rating: '4.5',
    address: const GarageAddress(
      streetAddress: 'Piassa, Near Arat Kilo',
      city: 'Addis Ababa',
      region: 'Addis Ababa',
    ),
    distanceKm: 5.2,
    distanceLabel: '5.2 km',
    description:
        'Affordable and reliable auto repair services. Family-owned business since 2010.',
    phoneNumber: '+251944567890',
    email: 'info@piassaauto.com',
    specialties: ['General Repair', 'Welding', 'Painting', 'Suspension'],
    isVerified: true,
    imageUrl: '/uploads/garages/piassa-auto.jpg',
    createdAt: DateTime(2025, 7, 10),
    updatedAt: DateTime(2026, 3, 25),
  );

  static final kazanchisService = Garage(
    id: 5,
    name: 'Kazanchis Service Center',
    rating: '4.6',
    address: const GarageAddress(
      streetAddress: 'Kazanchis, Behind Commercial Bank',
      city: 'Addis Ababa',
      region: 'Addis Ababa',
    ),
    distanceKm: 4.1,
    distanceLabel: '4.1 km',
    description:
        'Full-service auto center with modern equipment. Quick turnaround times.',
    phoneNumber: '+251955678901',
    email: 'service@kazanchis.com',
    specialties: ['Quick Service', 'Alignment', 'Battery', 'Exhaust'],
    isVerified: true,
    imageUrl: '/uploads/garages/kazanchis-service.jpg',
    createdAt: DateTime(2025, 10, 5),
    updatedAt: DateTime(2026, 4, 12),
  );

  static final gerjiAutoWorks = Garage(
    id: 6,
    name: 'Gerji Auto Works',
    rating: '4.4',
    address: const GarageAddress(
      streetAddress: 'Gerji, Near Mebrat Hail',
      city: 'Addis Ababa',
      region: 'Addis Ababa',
    ),
    distanceKm: 6.7,
    distanceLabel: '6.7 km',
    description:
        'Specialized in Japanese and Korean vehicles. Expert technicians.',
    phoneNumber: '+251966789012',
    email: 'info@gerjiauto.com',
    specialties: [
      'Japanese Cars',
      'Korean Cars',
      'Hybrid Service',
      'Diagnostics'
    ],
    isVerified: true,
    imageUrl: '/uploads/garages/gerji-auto.jpg',
    createdAt: DateTime(2025, 11, 20),
    updatedAt: DateTime(2026, 4, 8),
  );

  // All garages list
  static final allGarages = [
    boleGarage,
    reliableAutoCare,
    mercuryMotors,
    piassaAutoRepair,
    kazanchisService,
    gerjiAutoWorks,
  ];

  // Get garages sorted by distance
  static List<Garage> getNearbyGarages() {
    final garages = List<Garage>.from(allGarages);
    garages.sort((a, b) => (a.distanceKm ?? 0).compareTo(b.distanceKm ?? 0));
    return garages;
  }

  // Get garage by ID
  static Garage? getGarageById(int id) {
    try {
      return allGarages.firstWhere((garage) => garage.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search garages by name
  static List<Garage> searchGarages(String query) {
    final lowerQuery = query.toLowerCase();
    return allGarages
        .where((garage) =>
            garage.name.toLowerCase().contains(lowerQuery) ||
            garage.description?.toLowerCase().contains(lowerQuery) == true)
        .toList();
  }

  // Filter by specialty
  static List<Garage> filterBySpecialty(String specialty) {
    return allGarages
        .where((garage) =>
            garage.specialties?.any(
                (s) => s.toLowerCase().contains(specialty.toLowerCase())) ==
            true)
        .toList();
  }
}
