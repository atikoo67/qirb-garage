import 'package:qirb_garage/src/features/spare_parts/domain/entities/spare_part.dart';
import 'package:qirb_garage/src/features/spare_parts/domain/entities/spare_part_request.dart';
import 'package:qirb_garage/src/shared/enums/spare_part_condition.dart';

/// Mock spare parts data based on API documentation
class MockSpareParts {
  MockSpareParts._();

  static final brakePad = SparePart(
    id: 100,
    sellerId: 40,
    sellerName: 'Samuel Parts',
    name: 'Front Brake Pads - Corolla',
    description: 'High performance ceramic brake pads for Toyota Corolla',
    referenceNumber: 'BP-TC-2015-F',
    category: 'Brakes',
    condition: SparePartCondition.newPart,
    price: 2500,
    currency: 'ETB',
    compatibleVehicles: ['Toyota Corolla 2015-2022', 'Toyota Vitz 2015-2020'],
    stockQuantity: 15,
    imageUrls: [
      '/uploads/parts/brake-pad-1.jpg',
      '/uploads/parts/brake-pad-2.jpg',
    ],
    createdAt: DateTime(2026, 3, 15),
    updatedAt: DateTime(2026, 4, 10),
  );

  static final oilFilter = SparePart(
    id: 101,
    sellerId: 40,
    sellerName: 'Samuel Parts',
    name: 'Oil Filter - Universal',
    description: 'Premium oil filter compatible with most Japanese vehicles',
    referenceNumber: 'OF-UNI-001',
    category: 'Engine',
    condition: SparePartCondition.newPart,
    price: 450,
    currency: 'ETB',
    compatibleVehicles: [
      'Toyota Corolla',
      'Honda Civic',
      'Nissan Sentra',
      'Mazda 3'
    ],
    stockQuantity: 50,
    imageUrls: ['/uploads/parts/oil-filter.jpg'],
    createdAt: DateTime(2026, 3, 20),
    updatedAt: DateTime(2026, 4, 15),
  );

  static final airFilter = SparePart(
    id: 102,
    sellerId: 40,
    sellerName: 'Samuel Parts',
    name: 'Air Filter - BMW X5',
    description: 'Original equipment quality air filter for BMW X5',
    referenceNumber: 'AF-BMW-X5-2018',
    category: 'Engine',
    condition: SparePartCondition.newPart,
    price: 1800,
    currency: 'ETB',
    compatibleVehicles: ['BMW X5 2015-2022', 'BMW X3 2016-2022'],
    stockQuantity: 8,
    imageUrls: ['/uploads/parts/air-filter-bmw.jpg'],
    createdAt: DateTime(2026, 4, 1),
    updatedAt: DateTime(2026, 4, 18),
  );

  static final sparkPlugs = SparePart(
    id: 103,
    sellerId: 40,
    sellerName: 'Samuel Parts',
    name: 'Spark Plugs Set - 4pcs',
    description:
        'Iridium spark plugs for better performance and fuel efficiency',
    referenceNumber: 'SP-IRD-4PC',
    category: 'Engine',
    condition: SparePartCondition.newPart,
    price: 3200,
    currency: 'ETB',
    compatibleVehicles: [
      'Toyota Corolla',
      'Honda Civic',
      'Hyundai Elantra',
      'Mazda 3'
    ],
    stockQuantity: 20,
    imageUrls: ['/uploads/parts/spark-plugs.jpg'],
    createdAt: DateTime(2026, 3, 25),
    updatedAt: DateTime(2026, 4, 12),
  );

  static final batteryUsed = SparePart(
    id: 104,
    sellerId: 40,
    sellerName: 'Samuel Parts',
    name: 'Car Battery 70Ah',
    description: 'Used car battery in good condition, 6 months warranty',
    referenceNumber: 'BAT-70AH-USED',
    category: 'Electrical',
    condition: SparePartCondition.used,
    price: 2800,
    currency: 'ETB',
    compatibleVehicles: ['Universal - Most sedans and small SUVs'],
    stockQuantity: 5,
    imageUrls: ['/uploads/parts/battery-used.jpg'],
    createdAt: DateTime(2026, 4, 5),
    updatedAt: DateTime(2026, 4, 16),
  );

  static final headlight = SparePart(
    id: 105,
    sellerId: 40,
    sellerName: 'Samuel Parts',
    name: 'LED Headlight - Vitz',
    description: 'Aftermarket LED headlight assembly for Toyota Vitz',
    referenceNumber: 'HL-LED-VITZ-R',
    category: 'Body',
    condition: SparePartCondition.newPart,
    price: 4500,
    currency: 'ETB',
    compatibleVehicles: ['Toyota Vitz 2010-2018'],
    stockQuantity: 3,
    imageUrls: [
      '/uploads/parts/headlight-vitz-1.jpg',
      '/uploads/parts/headlight-vitz-2.jpg',
    ],
    createdAt: DateTime(2026, 4, 8),
    updatedAt: DateTime(2026, 4, 19),
  );

  static final tireMichelin = SparePart(
    id: 106,
    sellerId: 40,
    sellerName: 'Samuel Parts',
    name: 'Michelin Tire 205/55R16',
    description: 'Premium Michelin tire with excellent grip and durability',
    referenceNumber: 'TIRE-MICH-205-55-16',
    category: 'Tires',
    condition: SparePartCondition.newPart,
    price: 8500,
    currency: 'ETB',
    compatibleVehicles: [
      'Toyota Corolla',
      'Honda Civic',
      'Mazda 3',
      'Hyundai Elantra'
    ],
    stockQuantity: 12,
    imageUrls: ['/uploads/parts/tire-michelin.jpg'],
    createdAt: DateTime(2026, 3, 10),
    updatedAt: DateTime(2026, 4, 14),
  );

  // Spare part requests
  static final request1 = SparePartRequest(
    id: 800,
    spareId: 100,
    customerId: 12,
    customerName: 'Abebe Bikila',
    quantity: 1,
    notes: 'Looking for front brake pads for my 2018 Corolla',
    status: 'PENDING',
    createdAt: DateTime(2026, 4, 19),
  );

  static final request2 = SparePartRequest(
    id: 801,
    spareId: 103,
    customerId: 13,
    customerName: 'Sara Tesfaye',
    quantity: 1,
    notes: 'Need spark plugs urgently',
    status: 'ACCEPTED',
    createdAt: DateTime(2026, 4, 18),
    updatedAt: DateTime(2026, 4, 19),
  );

  static final request3 = SparePartRequest(
    id: 802,
    spareId: 106,
    customerId: 14,
    customerName: 'Dawit Alemayehu',
    quantity: 4,
    notes: 'Need all 4 tires, can you give discount?',
    status: 'PENDING',
    createdAt: DateTime(2026, 4, 20),
  );

  // All spare parts list
  static final allSpareParts = [
    brakePad,
    oilFilter,
    airFilter,
    sparkPlugs,
    batteryUsed,
    headlight,
    tireMichelin,
  ];

  static final allRequests = [
    request1,
    request2,
    request3,
  ];

  // Get spare parts by seller ID
  static List<SparePart> getPartsBySeller(int sellerId) {
    return allSpareParts.where((part) => part.sellerId == sellerId).toList();
  }

  // Get spare parts by category
  static List<SparePart> getPartsByCategory(String category) {
    return allSpareParts
        .where((part) => part.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  // Get spare parts by condition
  static List<SparePart> getPartsByCondition(SparePartCondition condition) {
    return allSpareParts.where((part) => part.condition == condition).toList();
  }

  // Search spare parts
  static List<SparePart> searchParts(String query) {
    final lowerQuery = query.toLowerCase();
    return allSpareParts
        .where((part) =>
            part.name.toLowerCase().contains(lowerQuery) ||
            part.description.toLowerCase().contains(lowerQuery) ||
            part.category.toLowerCase().contains(lowerQuery))
        .toList();
  }

  // Get spare part by ID
  static SparePart? getPartById(int id) {
    try {
      return allSpareParts.firstWhere((part) => part.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get in-stock parts only
  static List<SparePart> getInStockParts() {
    return allSpareParts.where((part) => part.isInStock).toList();
  }

  // Get requests by customer ID
  static List<SparePartRequest> getRequestsByCustomer(int customerId) {
    return allRequests
        .where((request) => request.customerId == customerId)
        .toList();
  }

  // Get requests by status
  static List<SparePartRequest> getRequestsByStatus(String status) {
    return allRequests.where((request) => request.status == status).toList();
  }
}
