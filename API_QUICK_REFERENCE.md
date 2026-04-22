# 🚀 Qirb Garage API - Quick Reference Card

## 📍 Base URLs

```dart
BASE_API_URL=http://localhost:5000/api
MEDIA_BASE_URL=http://localhost:5000/uploads
```

---

## 🔐 Authentication

### Login
```dart
POST /auth/login
Body: { "email": "user@example.com", "password": "pass123" }
Response: { "success": true, "token": "JWT...", "user": {...} }
```

### Register Customer
```dart
POST /auth/register
Body: {
  "fullName": "John Doe",
  "email": "john@example.com",
  "password": "pass123",
  "phoneNumber": "+251911223344",
  "role": "User"
}
```

### Get Current User
```dart
GET /auth/me
Headers: Authorization: Bearer <TOKEN>
```

---

## 🏢 Garage Discovery

### Nearby Garages
```dart
GET /garages/nearby?lat=9.0123&lng=38.7456
Response: {
  "success": true,
  "userLocation": { "lat": 9.0123, "lng": 38.7456 },
  "data": [{ "id": 4, "name": "...", "distanceKm": 1.2 }]
}
```

### Garage Details
```dart
GET /garages/:id
```

---

## 📅 Bookings

### Create Booking (Shop Service)
```dart
POST /bookings
Body: {
  "garageId": 4,
  "vehicleInfo": "Toyota Vitz 2015 Silver",
  "scheduledAt": "2026-05-25T14:00:00Z",
  "isOnSite": false,
  "customerFeedback": "Oil change needed"
}
```

### Create Booking (Mobile Mechanic)
```dart
POST /bookings
Body: {
  "garageId": 4,
  "vehicleInfo": "Toyota Vitz 2015 Silver",
  "scheduledAt": "2026-05-25T14:00:00Z",
  "isOnSite": true,
  "locationLat": 9.02,
  "locationLng": 38.75,
  "locationAddress": "Bole, Addis Ababa",
  "customerFeedback": "Strange noise"
}
```

### My Bookings
```dart
GET /bookings/my
```

### Cancel Booking
```dart
PUT /bookings/:id/status
Body: { "status": "CANCELLED" }
```

---

## 🛒 Spare Parts

### Browse Parts
```dart
GET /spare-parts
Query: ?page=1&limit=20
```

### Create Part Request
```dart
POST /spare-part-requests
Body: {
  "spareId": 401,
  "quantity": 1,
  "notes": "Need urgently"
}
```

### My Requests
```dart
GET /spare-part-requests/my
```

---

## 🏢 Garage Owner

### Dashboard Stats
```dart
GET /garage-owner/stats
Response: {
  "totalBookings": 154,
  "totalRevenue": 450000.50,
  "activeStaff": 8,
  "pendingRequests": 5,
  "revenueCurrency": "ETB"
}
```

### All Bookings
```dart
GET /garage-owner/bookings
```

### Accept/Reject Booking
```dart
PUT /garage-owner/bookings/:id/status
Body: { "status": "ACCEPTED" }  // or "REJECTED"
```

### Assign Staff
```dart
PUT /garage-owner/bookings/:id/assign
Body: { "staffId": 22 }
```

### Add Staff
```dart
POST /garage-owner/staff
Body: {
  "fullName": "John Doe",
  "email": "john@example.com",
  "specialization": "Electrician"
}
```

---

## 🔧 Staff (Mechanics)

### My Jobs
```dart
GET /staff-dashboard/jobs
```

### Update Job Status
```dart
PUT /staff-dashboard/jobs/:id/status
Body: { "status": "IN_PROGRESS" }
// Status flow: ACCEPTED → EN_ROUTE → IN_PROGRESS → COMPLETED
```

---

## 🛍️ Seller

### My Inventory
```dart
GET /spare-parts/my
```

### Add Part
```dart
POST /spare-parts
Body: {
  "name": "Front Brake Pads - Corolla",
  "description": "High performance ceramic pads",
  "price": 2500,
  "vehicleModel": "Toyota Corolla 2015-2022",
  "category": "Brakes",
  "condition": "New"
}
```

### Update Part
```dart
PUT /spare-parts/:id
Body: { "price": 2800 }
```

### Incoming Inquiries
```dart
GET /spare-requests/seller
```

### Respond to Inquiry
```dart
PUT /spare-requests/:id/status
Body: { "status": "ACCEPTED" }  // or "REJECTED"
```

---

## 💬 Messaging

### Conversations
```dart
GET /messages/conversations
```

### Messages in Conversation
```dart
GET /messages/:convoId/messages
```

### Send Message
```dart
POST /messages/send
Body: {
  "receiverId": 12,
  "content": "Hello, your car is ready!"
}
```

### Start Conversation
```dart
POST /messages/initiate
Body: { "receiverId": 12 }
```

---

## 🔔 Notifications

### Unread Counts
```dart
GET /notifications/unread-counts
```

---

## 📋 Lookups

### Cities
```dart
GET /lookups/cities
```

### Vehicle Types
```dart
GET /lookups/vehicle-types
Response: [
  { "id": 1, "make": "Toyota", "model": "Corolla", "category": "Passenger" }
]
```

### Service Types
```dart
GET /lookups/service-types
Response: [
  { "id": 5, "name": "Oil Change", "estimatedDuration": 45 }
]
```

---

## ⭐ Reviews

### Submit Review
```dart
POST /reviews
Body: {
  "garageId": 4,
  "bookingId": 105,
  "rating": 5,
  "comment": "Excellent service!"
}
```

### Garage Reviews
```dart
GET /reviews/garage/:id
```

---

## 🔑 User Roles

| API Value | Enum | Description |
|-----------|------|-------------|
| `User` | `UserRole.user` | Customer |
| `GarageOwner` | `UserRole.garageOwner` | Garage owner |
| `Staff` | `UserRole.staff` | Mechanic |
| `SparePartSeller` | `UserRole.sparePartSeller` | Parts seller |

---

## 📊 Booking Statuses

| Status | Description |
|--------|-------------|
| `PENDING` | Awaiting garage response |
| `ACCEPTED` | Garage accepted |
| `REJECTED` | Garage rejected |
| `EN_ROUTE` | Mechanic traveling (mobile) |
| `IN_PROGRESS` | Work in progress |
| `COMPLETED` | Job finished |
| `CANCELLED` | Customer cancelled |

---

## 🎯 Common Patterns

### Authorization Header
```dart
headers: {
  'Authorization': 'Bearer $token',
  'Content-Type': 'application/json',
}
```

### Date Format
```dart
// Always use ISO 8601
final date = DateTime.now().toIso8601String();
// "2026-05-25T14:00:00.000Z"
```

### Image URLs
```dart
final fullUrl = '$MEDIA_BASE_URL${apiPath}';
// http://localhost:5000/uploads/garage-photo.jpg
```

### Pagination
```dart
queryParameters: {
  'page': 1,
  'limit': 20,
}
```

### Error Handling
```dart
if (response.data['success'] == false) {
  final message = response.data['message'];
  throw ServerException(message);
}
```

---

## 📱 Quick Code Snippets

### Login
```dart
final response = await dio.post(
  ApiConstants.login,
  data: {'email': email, 'password': password},
);
final token = response.data['token'];
final user = UserModel.fromJson(response.data['user']);
```

### Nearby Garages
```dart
final response = await dio.get(
  ApiConstants.garagesNearby,
  queryParameters: {'lat': lat, 'lng': lng},
);
final garages = (response.data['data'] as List)
    .map((json) => GarageModel.fromJson(json))
    .toList();
```

### Create Booking
```dart
final response = await dio.post(
  ApiConstants.bookings,
  data: {
    'garageId': garageId,
    'vehicleInfo': vehicleInfo,
    'scheduledAt': scheduledAt.toIso8601String(),
    'isOnSite': isOnSite,
    if (isOnSite) ...{
      'locationLat': lat,
      'locationLng': lng,
      'locationAddress': address,
    },
    'customerFeedback': feedback,
  },
);
```

---

## 🔍 Constants Location

```dart
import 'package:qirb_garage/src/shared/constants/api_constants.dart';

// Usage
ApiConstants.login
ApiConstants.garagesNearby
ApiConstants.bookings
ApiConstants.garageOwnerStats
ApiConstants.staffDashboardJobs
```

---

## 📚 Full Documentation

- **Complete Guide**: `API_INTEGRATION_GUIDE.md`
- **Update Summary**: `API_UPDATE_SUMMARY.md`
- **Implementation**: `IMPLEMENTATION_CHECKLIST.md`

---

**Print this card and keep it handy! 📌**
