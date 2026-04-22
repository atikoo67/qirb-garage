# Master API Request/Response Specification

This document contains a line-by-line formatted specification of every non-admin endpoint in the Qirb system.

---

### `POST /auth/login`
**Request Body**:
```json
{
  "email": "customer@qirb.com",
  "password": "password123"
}
```
**Response Body**:
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

### `POST /auth/register`
**Request Body**:
```json
{
  "fullName": "Sara Tesfaye",
  "email": "sara@example.com",
  "password": "securePass886",
  "phoneNumber": "+251912345678",
  "role": "User"
}
```
**Response Body**:
```json
{
  "success": true,
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": 13,
    "fullName": "Sara Tesfaye",
    "role": "User"
  }
}
```

### `POST /auth/register/spare-seller`
**Request Body**:
```json
{
  "fullName": "Samuel Parts",
  "shopName": "Sam Spare Parts",
  "email": "sam@parts.com",
  "password": "password123",
  "city": "Addis Ababa",
  "phoneNumber": "+251...",
  "verificationDoc": "(file)",
  "shopPhotos": "(file)"
}
```
**Response Body**:
```json
{
  "success": true,
  "token": "...",
  "user": { "id": 14, "fullName": "Samuel Parts", "role": "SparePartSeller" },
  "applicationId": 5
}
```

### `GET /auth/me`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "user": { "id": 12, "fullName": "Abebe Bikila", "role": "User" }
}
```

### `GET /garages`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "count": 1,
  "data": [
    { "id": 1, "name": "Bole Garage", "status": "APPROVED" }
  ]
}
```

### `GET /garages/nearby`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "userLocation": { "lat": 9.0, "lng": 38.0 },
  "data": [
    { "id": 1, "name": "Bole Garage", "distanceKm": 2.5 }
  ]
}
```

### `POST /bookings`
**Request Body**:
```json
{
  "garageId": 1,
  "vehicleInfo": "Toyota Corolla 2022",
  "scheduledAt": "2026-05-20T10:00:00Z",
  "isOnSite": false
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 50, "status": "PENDING", "scheduledAt": "..." }
}
```

### `GET /bookings/my`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "data": [
    { "id": 50, "garage": { "name": "Bole Garage" }, "status": "PENDING" }
  ]
}
```

### `PUT /bookings/:id/status`
**Request Body**:
```json
{
  "status": "CANCELLED"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 50, "status": "CANCELLED" }
}
```

### `GET /garage-owner/stats`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "totalBookings": 100, "totalRevenue": 50000.0, "activeStaff": 5 }
}
```

### `GET /garage-owner/staff`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "data": [
    { "id": 5, "fullName": "Staff Member 1", "specialization": "Engine" }
  ]
}
```

### `POST /garage-owner/staff`
**Request Body**:
```json
{
  "fullName": "New Staff",
  "email": "staff@example.com",
  "specialization": "Tires",
  "password": "staffPassword"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 6, "fullName": "New Staff" }
}
```

### `PUT /garage-owner/bookings/:id/assign`
**Request Body**:
```json
{
  "staffId": 5
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 50, "assignedStaffId": 5, "status": "ACCEPTED" }
}
```

### `GET /staff-dashboard/jobs`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "data": [
    { "id": 50, "status": "ACCEPTED", "customerName": "Abebe Bikila" }
  ]
}
```

### `PUT /staff-dashboard/jobs/:id/status`
**Request Body**:
```json
{
  "status": "IN_PROGRESS"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 50, "status": "IN_PROGRESS" }
}
```

### `GET /spare-parts`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "data": [
    { "id": 100, "name": "Brake Pad", "price": 1500, "condition": "New" }
  ]
}
```

### `POST /spare-parts`
**Request Body**:
```json
{
  "name": "Brake Pad",
  "price": 1500,
  "category": "Brakes",
  "vehicleModel": "Toyota Corolla",
  "condition": "New"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 100, "name": "Brake Pad" }
}
```

### `POST /spare-part-requests`
**Request Body**:
```json
{
  "spareId": 100,
  "quantity": 1,
  "notes": "Looking for front pads"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 800, "status": "PENDING" }
}
```

### `GET /lookups/vehicle-types`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "data": [
    { "id": 1, "make": "Toyota", "model": "Corolla" }
  ]
}
```

### `GET /messages/conversations`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "data": [
    { "id": 200, "otherUser": { "fullName": "Garage Owner" }, "lastMessage": "Hello" }
  ]
}
```

### `POST /messages/send`
**Request Body**:
```json
{
  "receiverId": 1,
  "content": "Hi, is my car ready?"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 5000, "content": "..." }
}
```

### `GET /notifications/unread-counts`
**Request Body**:
```json
{}
```
**Response Body**:
```json
{
  "success": true,
  "unreadMessages": 2,
  "pendingBookings": 1
}
```

### `POST /applications`
**Request Body**:
```json
{
  "businessName": "My Garage",
  "businessLicense": "(file)",
  "ownerIdDocument": "(file)",
  "city": "Addis Ababa"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 10, "status": "PENDING" }
}
```
