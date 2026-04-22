# Qirb Garage API Integration Guide

This guide provides a comprehensive overview of how the mobile app integrates with the Qirb Garage API based on the official API documentation.

---

## 📋 Table of Contents

1. [API Overview](#api-overview)
2. [Authentication](#authentication)
3. [API Modules](#api-modules)
4. [Request/Response Standards](#requestresponse-standards)
5. [Implementation Mapping](#implementation-mapping)

---

## API Overview

### Base Configuration

```dart
// .env file
BASE_API_URL=http://localhost:5000/api
MEDIA_BASE_URL=http://localhost:5000/uploads
```

### Response Standards

#### Success Response
```json
{
  "success": true,
  "count": 10,
  "data": { ... }
}
```

#### Error Response
```json
{
  "success": false,
  "message": "Error description"
}
```

---

## Authentication

### Login Flow

**Endpoint**: `POST /auth/login`

**Request**:
```json
{
  "email": "customer@qirb.com",
  "password": "password123"
}
```

**Response**:
```json
{
  "success": true,
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": 12,
    "fullName": "Abebe Bikila",
    "email": "customer@qirb.com",
    "role": "User",
    "phoneNumber": "+251911223344"
  },
  "applicationStatus": "APPROVED"
}
```

### User Roles

| API Role | App Enum | Description |
|----------|----------|-------------|
| `User` | `UserRole.user` | Customer |
| `GarageOwner` | `UserRole.garageOwner` | Garage owner |
| `Staff` | `UserRole.staff` | Mechanic |
| `SparePartSeller` | `UserRole.sparePartSeller` | Parts seller |

### Token Usage

All authenticated endpoints require:
```
Authorization: Bearer <JWT_TOKEN>
```

---

## API Modules

### Module 1: Public Endpoints (No Auth)

#### Garage Discovery
- `GET /garages` - List all garages
- `GET /garages/nearby?lat=X&lng=Y` - Nearby garages
- `GET /garages/:id` - Garage details

#### Spare Parts
- `GET /spare-parts` - Browse parts
- `GET /spare-parts/:id` - Part details

#### Lookups
- `GET /lookups/cities` - Supported cities
- `GET /lookups/vehicle-types` - Vehicle makes/models
- `GET /lookups/service-types` - Service types

#### Reviews
- `GET /reviews/garage/:id` - Garage reviews

---

### Module 2: Global Services (All Authenticated Users)

#### User Context
- `GET /auth/me` - Get current user info

#### Notifications
- `GET /notifications/unread-counts` - Badge counts

#### Messaging
- `GET /messages/conversations` - Chat list
- `GET /messages/:convoId/messages` - Message history
- `POST /messages/send` - Send message
- `POST /messages/initiate` - Start conversation

---

### Module 3: Customer Endpoints

#### Bookings
- `POST /bookings` - Create booking
- `GET /bookings/my` - My bookings
- `PUT /bookings/:id/status` - Cancel booking

**Create Booking Request**:
```json
{
  "garageId": 4,
  "vehicleInfo": "Toyota Vitz 2015 Silver",
  "scheduledAt": "2026-05-25T14:00:00Z",
  "isOnSite": true,
  "locationLat": 9.02,
  "locationLng": 38.75,
  "locationAddress": "Bole, Addis Ababa",
  "customerFeedback": "Strange noise from front right wheel"
}
```

#### Spare Part Requests
- `POST /spare-part-requests` - Submit inquiry
- `GET /spare-part-requests/my` - My requests

#### Reviews
- `POST /reviews` - Submit review

#### Saved Garages
- `GET /saved-garages` - Bookmarked garages
- `POST /saved-garages` - Bookmark garage

---

### Module 4: Garage Owner Endpoints

#### Applications
- `POST /applications` - Apply for verification
- `GET /applications/status` - Check status

#### Dashboard
- `GET /garage-owner/stats` - Statistics

**Stats Response**:
```json
{
  "success": true,
  "data": {
    "totalBookings": 154,
    "totalRevenue": 450000.50,
    "activeStaff": 8,
    "pendingRequests": 5,
    "revenueCurrency": "ETB"
  }
}
```

#### Booking Management
- `GET /garage-owner/bookings` - All bookings
- `PUT /garage-owner/bookings/:id/status` - Accept/Reject
- `PUT /garage-owner/bookings/:id/assign` - Assign staff

**Assign Staff Request**:
```json
{
  "staffId": 22
}
```

#### Staff Management
- `GET /garage-owner/staff` - Staff list
- `POST /garage-owner/staff` - Add staff

**Add Staff Request**:
```json
{
  "fullName": "John Doe",
  "email": "john@example.com",
  "specialization": "Electrician"
}
```

#### Services
- `GET /garage-owner/services` - Service catalog
- `PUT /garage-owner/services/:id` - Update service

---

### Module 5: Staff Endpoints

#### Job Management
- `GET /staff-dashboard/jobs` - Assigned jobs
- `PUT /staff-dashboard/jobs/:id/status` - Update status

**Update Status Request**:
```json
{
  "status": "IN_PROGRESS"
}
```

**Status Flow**: `ACCEPTED` → `EN_ROUTE` → `IN_PROGRESS` → `COMPLETED`

---

### Module 6: Seller Endpoints

#### Inventory
- `GET /spare-parts/my` - My inventory
- `POST /spare-parts` - List new part
- `PUT /spare-parts/:id` - Update part

**Create Part Request**:
```json
{
  "name": "Front Brake Pads - Corolla",
  "description": "High performance ceramic pads",
  "price": 2500,
  "vehicleModel": "Toyota Corolla 2015-2022",
  "category": "Brakes",
  "condition": "New"
}
```

#### Inquiries
- `GET /spare-requests/seller` - Incoming inquiries
- `PUT /spare-requests/:id/status` - Accept/Reject

---

## Request/Response Standards

### Date Format
Always use **ISO 8601** format:
```
2026-05-25T14:00:00Z
```

### Null Handling
Use `null` for optional fields:
```json
{
  "locationLat": null,
  "locationLng": null
}
```

### Image URLs
Combine API path with host:
```dart
final imageUrl = '$MEDIA_BASE_URL${apiPath}';
// Example: http://localhost:5000/uploads/garage-photo.jpg
```

### Pagination
For large lists, use query parameters:
```
?page=1&limit=20
```

---

## Implementation Mapping

### Entities Created

| API Response | Entity File | Location |
|--------------|-------------|----------|
| User | `user.dart` | `features/auth/domain/entities/` |
| Garage | `garage.dart` | `features/garage/domain/entities/` |
| Booking | `booking.dart` | `features/booking/domain/entities/` |
| SparePart | `spare_part.dart` | `features/spare_parts/domain/entities/` |
| Message | `message.dart` | `features/messaging/domain/entities/` |
| Conversation | `conversation.dart` | `features/messaging/domain/entities/` |
| Review | `review.dart` | `shared/entities/` |
| VehicleType | `vehicle_type.dart` | `shared/entities/` |
| ServiceType | `service_type.dart` | `shared/entities/` |
| Staff | `staff.dart` | `features/garage_owner/domain/entities/` |
| GarageOwnerStats | `garage_owner_stats.dart` | `features/garage_owner/domain/entities/` |
| SparePartRequest | `spare_part_request.dart` | `features/spare_parts/domain/entities/` |

### Enums Created

| API Value | Enum File | Values |
|-----------|-----------|--------|
| User roles | `user_role.dart` | User, GarageOwner, Staff, SparePartSeller |
| Booking status | `booking_status.dart` | PENDING, ACCEPTED, REJECTED, IN_PROGRESS, EN_ROUTE, COMPLETED, CANCELLED |
| Application status | `application_status.dart` | PENDING, APPROVED, REJECTED |
| Part condition | `spare_part_condition.dart` | NEW, USED |

### API Constants

All endpoints are defined in:
```
lib/src/shared/constants/api_constants.dart
```

Organized by module:
- Module 1: Public endpoints
- Module 2: Global services
- Module 3: Customer endpoints
- Module 4: Garage owner endpoints
- Module 5: Staff endpoints
- Module 6: Seller endpoints

---

## Next Steps

### 1. Implement Data Models

Create JSON serialization models in `data/models/` for each entity:

```dart
class UserModel extends AppUser {
  const UserModel({...});
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: UserRole.fromString(json['role']),
      applicationStatus: json['applicationStatus'] != null
          ? ApplicationStatus.fromString(json['applicationStatus'])
          : null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role.value,
    };
  }
}
```

### 2. Create Data Sources

Implement API clients in `data/datasources/`:

```dart
abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> register(Map<String, dynamic> data);
  Future<UserModel> getCurrentUser();
}
```

### 3. Implement Repositories

Create repository implementations in `data/repositories/`:

```dart
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  
  @override
  Future<Either<Failure, AppUser>> login(String email, String password) async {
    try {
      final response = await remoteDataSource.login(email, password);
      return Right(response.user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

### 4. Create Use Cases

Implement business logic in `domain/usecases/`:

```dart
class LoginUseCase {
  final AuthRepository repository;
  
  Future<Either<Failure, AppUser>> call(String email, String password) {
    return repository.login(email, password);
  }
}
```

### 5. Build UI

Create screens and providers in `presentation/`:

```dart
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(loginUseCaseProvider));
});
```

---

## Testing Checklist

- [ ] Test login with all user roles
- [ ] Test garage discovery with location
- [ ] Test booking creation (shop vs mobile)
- [ ] Test spare part requests
- [ ] Test messaging
- [ ] Test garage owner dashboard
- [ ] Test staff job updates
- [ ] Test seller inventory management
- [ ] Test error handling
- [ ] Test token refresh
- [ ] Test offline scenarios

---

**For detailed implementation steps, refer to `IMPLEMENTATION_CHECKLIST.md`**

---

**© 2026 Qirb Garage Platform. All rights reserved.**
