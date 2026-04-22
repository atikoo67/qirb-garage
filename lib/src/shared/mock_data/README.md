# Mock Data Documentation

This directory contains comprehensive mock data for the Qirb Garage mobile application, based on the official API documentation.

## 📋 Overview

Mock data is provided for testing, development, and UI prototyping without requiring a live backend connection.

## 📁 Files

### 1. `mock_users.dart`
Mock user data for all roles:
- **Customers**: Abebe Bikila, Sara Tesfaye, Dawit Alemayehu
- **Garage Owners**: Meseret Defar (approved), Haile Gebrselassie (pending)
- **Staff**: Kenenisa Bekele
- **Sellers**: Samuel Parts

**Usage**:
```dart
import 'package:qirb_garage/src/shared/mock_data/mock_data.dart';

final customer = MockUsers.customer;
final allCustomers = MockUsers.getUsersByRole(UserRole.user);
final user = MockUsers.getUserById(12);
```

### 2. `mock_garages.dart`
Mock garage data with locations in Addis Ababa:
- Bole Garage (1.2 km)
- Reliable Auto Care (2.5 km)
- Mercury Motors (3.8 km)
- Piassa Auto Repair (5.2 km)
- Kazanchis Service Center (4.1 km)
- Gerji Auto Works (6.7 km)

**Usage**:
```dart
final nearbyGarages = MockGarages.getNearbyGarages();
final garage = MockGarages.getGarageById(1);
final searchResults = MockGarages.searchGarages('bole');
final engineGarages = MockGarages.filterBySpecialty('Engine');
```

### 3. `mock_bookings.dart`
Mock booking data with various statuses:
- Pending bookings
- Accepted bookings (with staff assigned)
- In-progress bookings
- En-route bookings (mobile mechanic)
- Completed bookings
- Cancelled bookings
- Rejected bookings

**Usage**:
```dart
final myBookings = MockBookings.getBookingsByCustomer(12);
final garageBookings = MockBookings.getBookingsByGarage(1);
final activeBookings = MockBookings.getActiveBookings();
final pendingBookings = MockBookings.getBookingsByStatus(BookingStatus.pending);
```

### 4. `mock_spare_parts.dart`
Mock spare parts and requests:
- **Parts**: Brake pads, oil filters, air filters, spark plugs, batteries, headlights, tires
- **Conditions**: New and used parts
- **Requests**: Pending, accepted, and rejected requests

**Usage**:
```dart
final allParts = MockSpareParts.allSpareParts;
final sellerParts = MockSpareParts.getPartsBySeller(40);
final brakeParts = MockSpareParts.getPartsByCategory('Brakes');
final newParts = MockSpareParts.getPartsByCondition(SparePartCondition.newPart);
final searchResults = MockSpareParts.searchParts('brake');
final myRequests = MockSpareParts.getRequestsByCustomer(12);
```

### 5. `mock_messages.dart`
Mock messaging data:
- Messages between customers and garage owners
- Messages between customers and sellers
- Messages between customers and staff
- Conversation threads with unread counts

**Usage**:
```dart
final conversations = MockMessages.allConversations;
final messages = MockMessages.getMessagesBetween(12, 20);
final myConversations = MockMessages.getConversationsForUser(12);
final unreadCount = MockMessages.getUnreadCount(12);
```

### 6. `mock_lookups.dart`
Mock lookup data:
- **Vehicle Types**: 15 vehicle makes/models (Toyota, Honda, Nissan, BMW, etc.)
- **Service Types**: 12 service types with durations
- **Cities**: 8 Ethiopian cities
- **Categories**: Spare part categories
- **Specializations**: Staff specializations

**Usage**:
```dart
final vehicleTypes = MockLookups.vehicleTypes;
final serviceTypes = MockLookups.serviceTypes;
final cities = MockLookups.cities;
final toyotaModels = MockLookups.getVehicleTypesByMake('Toyota');
final suvs = MockLookups.getVehicleTypesByCategory('SUV');
final makes = MockLookups.getAllMakes();
```

### 7. `mock_garage_owner.dart`
Mock garage owner data:
- **Statistics**: Revenue, bookings, staff counts
- **Staff**: 8 staff members with specializations
- **Applications**: Approved, pending, and rejected applications

**Usage**:
```dart
final stats = MockGarageOwner.stats;
final allStaff = MockGarageOwner.allStaff;
final garageStaff = MockGarageOwner.getStaffByGarage(1);
final activeStaff = MockGarageOwner.getActiveStaff();
final applications = MockGarageOwner.allApplications;
```

### 8. `mock_notifications.dart`
Mock notification data:
- **Counts**: Unread messages and pending bookings
- **Notifications**: Booking updates, messages, job assignments, part requests

**Usage**:
```dart
final counts = MockNotifications.counts;
final myNotifications = MockNotifications.getNotificationsByUser(12);
final unreadNotifications = MockNotifications.getUnreadNotifications(12);
final bookingNotifications = MockNotifications.getNotificationsByType(12, 'BOOKING');
```

## 🎯 Common Use Cases

### 1. Testing Authentication
```dart
// Test customer login
final customer = MockUsers.customer;
print('${customer.fullName} - ${customer.role.value}');

// Test garage owner with approved application
final owner = MockUsers.garageOwner;
print('Application Status: ${owner.applicationStatus?.value}');
```

### 2. Testing Garage Discovery
```dart
// Get nearby garages sorted by distance
final garages = MockGarages.getNearbyGarages();
for (var garage in garages) {
  print('${garage.name} - ${garage.distanceLabel}');
}
```

### 3. Testing Booking Flow
```dart
// Create booking (use mock data as reference)
final booking = MockBookings.pendingBooking;

// Get customer's bookings
final myBookings = MockBookings.getBookingsByCustomer(12);

// Filter by status
final activeBookings = MockBookings.getActiveBookings();
```

### 4. Testing Messaging
```dart
// Get conversations
final conversations = MockMessages.getConversationsForUser(12);

// Get messages in a conversation
final messages = MockMessages.getMessagesBetween(12, 20);

// Check unread count
final unreadCount = MockMessages.getUnreadCount(12);
```

### 5. Testing Garage Owner Dashboard
```dart
// Get statistics
final stats = MockGarageOwner.stats;
print('Total Revenue: ${stats.formattedRevenue}');

// Get staff
final staff = MockGarageOwner.getStaffByGarage(1);

// Get bookings for garage
final bookings = MockBookings.getBookingsByGarage(1);
```

## 🔧 Customization

You can easily extend or modify the mock data:

```dart
// Add a new user
static final newCustomer = AppUser(
  id: 99,
  fullName: 'New Customer',
  email: 'new@example.com',
  phoneNumber: '+251999999999',
  role: UserRole.user,
  createdAt: DateTime.now(),
);

// Add to the list
static final allUsers = [
  customer,
  // ... existing users
  newCustomer,
];
```

## 📊 Data Statistics

- **Users**: 7 (3 customers, 2 garage owners, 1 staff, 1 seller)
- **Garages**: 6 (all in Addis Ababa)
- **Bookings**: 7 (covering all statuses)
- **Spare Parts**: 7 (new and used)
- **Messages**: 7 (across 4 conversations)
- **Staff**: 8 (various specializations)
- **Vehicle Types**: 15 (5 makes)
- **Service Types**: 12 (with durations)
- **Notifications**: 8 (various types)

## 🎨 UI Testing

Use mock data for UI development:

```dart
// In your widget
class GarageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use mock data during development
    final garages = MockGarages.getNearbyGarages();
    
    return ListView.builder(
      itemCount: garages.length,
      itemBuilder: (context, index) {
        final garage = garages[index];
        return GarageCard(garage: garage);
      },
    );
  }
}
```

## ⚠️ Important Notes

1. **IDs are consistent**: User IDs, garage IDs, etc. are consistent across all mock data
2. **Relationships are maintained**: Bookings reference real garage and user IDs
3. **Dates are realistic**: All dates are set to April 2026 (current mock time)
4. **Ethiopian context**: Names, locations, and currency (ETB) reflect Ethiopian context
5. **API-aligned**: All data structures match the official API responses

## 🚀 Migration to Real API

When switching to real API:

1. Replace mock data imports with API calls
2. Use the same entity structures (already API-aligned)
3. Implement proper error handling
4. Add loading states

```dart
// Before (mock data)
final garages = MockGarages.getNearbyGarages();

// After (real API)
final garages = await garageRepository.getNearbyGarages(lat, lng);
```

## 📝 Maintenance

When API changes:
1. Update corresponding mock data file
2. Ensure data structures match API responses
3. Update this README if new files are added

---

**All mock data is based on the official Qirb Garage API documentation and is ready for immediate use in development and testing.**
