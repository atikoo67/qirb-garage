import 'package:qirb_garage/src/shared/entities/vehicle_type.dart';
import 'package:qirb_garage/src/shared/entities/service_type.dart';

/// Mock lookup data based on API documentation
class MockLookups {
  MockLookups._();

  // Vehicle Types
  static final vehicleTypes = [
    const VehicleType(
      id: 1,
      make: 'Toyota',
      model: 'Corolla',
      category: 'Passenger',
    ),
    const VehicleType(
      id: 2,
      make: 'Toyota',
      model: 'Vitz',
      category: 'Passenger',
    ),
    const VehicleType(
      id: 3,
      make: 'Toyota',
      model: 'Hilux',
      category: 'Truck',
    ),
    const VehicleType(
      id: 4,
      make: 'Honda',
      model: 'Civic',
      category: 'Passenger',
    ),
    const VehicleType(
      id: 5,
      make: 'Honda',
      model: 'CR-V',
      category: 'SUV',
    ),
    const VehicleType(
      id: 6,
      make: 'Nissan',
      model: 'Sentra',
      category: 'Passenger',
    ),
    const VehicleType(
      id: 7,
      make: 'Nissan',
      model: 'Patrol',
      category: 'SUV',
    ),
    const VehicleType(
      id: 8,
      make: 'BMW',
      model: 'X5',
      category: 'SUV',
    ),
    const VehicleType(
      id: 9,
      make: 'BMW',
      model: '3 Series',
      category: 'Passenger',
    ),
    const VehicleType(
      id: 10,
      make: 'Mercedes-Benz',
      model: 'C-Class',
      category: 'Passenger',
    ),
    const VehicleType(
      id: 11,
      make: 'Hyundai',
      model: 'Elantra',
      category: 'Passenger',
    ),
    const VehicleType(
      id: 12,
      make: 'Hyundai',
      model: 'Tucson',
      category: 'SUV',
    ),
    const VehicleType(
      id: 13,
      make: 'Mazda',
      model: '3',
      category: 'Passenger',
    ),
    const VehicleType(
      id: 14,
      make: 'Mazda',
      model: 'CX-5',
      category: 'SUV',
    ),
    const VehicleType(
      id: 15,
      make: 'Isuzu',
      model: 'NPR',
      category: 'Truck',
    ),
  ];

  // Service Types
  static final serviceTypes = [
    const ServiceType(
      id: 1,
      name: 'Oil Change',
      description: 'Standard oil and filter replacement',
      estimatedDuration: 45,
    ),
    const ServiceType(
      id: 2,
      name: 'Brake Service',
      description: 'Brake pad and rotor inspection and replacement',
      estimatedDuration: 90,
    ),
    const ServiceType(
      id: 3,
      name: 'Tire Rotation',
      description: 'Rotate tires for even wear',
      estimatedDuration: 30,
    ),
    const ServiceType(
      id: 4,
      name: 'Wheel Alignment',
      description: 'Adjust wheel angles for proper alignment',
      estimatedDuration: 60,
    ),
    const ServiceType(
      id: 5,
      name: 'Engine Diagnostics',
      description: 'Computer diagnostics to identify engine issues',
      estimatedDuration: 120,
    ),
    const ServiceType(
      id: 6,
      name: 'AC Repair',
      description: 'Air conditioning system inspection and repair',
      estimatedDuration: 150,
    ),
    const ServiceType(
      id: 7,
      name: 'Battery Replacement',
      description: 'Replace car battery and test charging system',
      estimatedDuration: 30,
    ),
    const ServiceType(
      id: 8,
      name: 'Transmission Service',
      description: 'Transmission fluid change and inspection',
      estimatedDuration: 180,
    ),
    const ServiceType(
      id: 9,
      name: 'Suspension Repair',
      description: 'Inspect and repair suspension components',
      estimatedDuration: 240,
    ),
    const ServiceType(
      id: 10,
      name: 'Electrical Repair',
      description: 'Diagnose and repair electrical issues',
      estimatedDuration: 120,
    ),
    const ServiceType(
      id: 11,
      name: 'Body Work',
      description: 'Dent removal and paint touch-up',
      estimatedDuration: 480,
    ),
    const ServiceType(
      id: 12,
      name: 'General Inspection',
      description: 'Comprehensive vehicle inspection',
      estimatedDuration: 60,
    ),
  ];

  // Cities
  static final cities = [
    'Addis Ababa',
    'Dire Dawa',
    'Mekelle',
    'Gondar',
    'Bahir Dar',
    'Hawassa',
    'Adama',
    'Jimma',
  ];

  // Categories for spare parts
  static final sparePartCategories = [
    'Engine',
    'Brakes',
    'Suspension',
    'Electrical',
    'Body',
    'Tires',
    'Transmission',
    'Exhaust',
    'Interior',
    'Accessories',
  ];

  // Specializations for staff
  static final staffSpecializations = [
    'Engine Specialist',
    'Electrician',
    'Body Work',
    'Tire Specialist',
    'Brake Specialist',
    'Transmission Specialist',
    'AC Specialist',
    'General Mechanic',
    'Diagnostics Specialist',
    'Suspension Specialist',
  ];

  // Get vehicle types by make
  static List<VehicleType> getVehicleTypesByMake(String make) {
    return vehicleTypes
        .where((vt) => vt.make.toLowerCase() == make.toLowerCase())
        .toList();
  }

  // Get vehicle types by category
  static List<VehicleType> getVehicleTypesByCategory(String category) {
    return vehicleTypes
        .where((vt) => vt.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  // Get all makes
  static List<String> getAllMakes() {
    return vehicleTypes.map((vt) => vt.make).toSet().toList()..sort();
  }

  // Get service type by ID
  static ServiceType? getServiceTypeById(int id) {
    try {
      return serviceTypes.firstWhere((st) => st.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search service types
  static List<ServiceType> searchServiceTypes(String query) {
    final lowerQuery = query.toLowerCase();
    return serviceTypes
        .where((st) =>
            st.name.toLowerCase().contains(lowerQuery) ||
            st.description.toLowerCase().contains(lowerQuery))
        .toList();
  }
}
