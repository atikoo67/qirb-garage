# Qirb Garage Platform: Detailed API Specification for Mobile Integration

This document contains precise request/response schemas for every non-admin endpoint in the Qirb ecosystem.

---

## 🔐 1. Authentication & Identity

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
**Response Body**: Same structure as Login.

---

## 🔍 2. Lookup Data (Dropdowns & Filters)

### `GET /lookups/vehicle-types`
**Response Body**:
```json
{
  "success": true,
  "data": [
    { "id": 1, "make": "Toyota", "model": "Corolla", "category": "Passenger" },
    { "id": 2, "make": "Isuzu", "model": "NPR", "category": "Truck" }
  ]
}
```

### `GET /lookups/service-types`
**Response Body**:
```json
{
  "success": true,
  "data": [
    { "id": 5, "name": "Oil Change", "description": "Standard oil and filter", "estimatedDuration": 45 },
    { "id": 8, "name": "Brake Service", "description": "Pad and rotor check", "estimatedDuration": 90 }
  ]
}
```

---

## 🏛️ 3. Garage Discovery (Customer)

### `GET /garages/nearby?lat=9.0123&lng=38.7456`
**Response Body**:
```json
{
  "success": true,
  "userLocation": { "lat": 9.0123, "lng": 38.7456 },
  "data": [
    {
      "id": 4,
      "name": "Reliable Auto Care",
      "rating": "4.8",
      "address": { "streetAddress": "Bole Rd", "city": "Addis Ababa" },
      "distanceKm": 1.2,
      "distanceLabel": "1.2 km"
    }
  ]
}
```

---

## 📅 4. Booking Lifecycle (Customer)

### `POST /bookings`
**Request Body**:
```json
{
  "garageId": 4,
  "vehicleInfo": "Toyota Vitz 2015 Silver",
  "scheduledAt": "2026-05-25T14:00:00Z",
  "isOnSite": true,
  "locationLat": 9.02,
  "locationLng": 38.75,
  "customerFeedback": "Strange noise from front right wheel"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": {
    "id": 105,
    "customerId": 12,
    "status": "PENDING",
    "scheduledAt": "2026-05-25T14:00:00Z"
  }
}
```

---

## 🏢 5. Garage Management (Owner)

### `GET /garage-owner/stats`
**Response Body**:
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

### `PUT /garage-owner/bookings/:id/assign`
**Request Body**:
```json
{
  "staffId": 22
}
```
**Response Body**:
```json
{
  "success": true,
  "message": "Staff member assigned successfully",
  "data": { "id": 105, "assignedStaffId": 22, "status": "ACCEPTED" }
}
```

---

## 🛠️ 6. Staff Operations (Mechanic)

### `GET /staff-dashboard/jobs`
**Response Body**:
```json
{
  "success": true,
  "data": [
    {
      "id": 105,
      "status": "ACCEPTED",
      "customerName": "Abebe Bikila",
      "vehicleInfo": "Toyota Vitz 2015 Silver",
      "customerFeedback": "Strange noise from front right wheel"
    }
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
  "data": { "id": 105, "status": "IN_PROGRESS" }
}
```

---

## 📦 7. Spare Parts Marketplace

### `POST /spare-parts` (Seller Stock)
**Request Body**:
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
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 401, "name": "Front Brake Pads - Corolla", "price": 2500 }
}
```

---

## 💬 8. Communication (Messaging)

### `POST /messages/send`
**Request Body**:
```json
{
  "receiverId": 12,
  "content": "Hello, your car is ready for pick up!"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": {
    "id": 5002,
    "senderId": 1,
    "receiverId": 12,
    "content": "Hello, your car is ready for pick up!",
    "createdAt": "2026-04-20T12:00:00Z"
  }
}
```

---

## 🌟 9. Reviews (Feedback)

### `POST /reviews`
**Request Body**:
```json
{
  "garageId": 4,
  "bookingId": 105,
  "rating": 5,
  "comment": "Excellent service and professional staff!"
}
```
**Response Body**:
```json
{
  "success": true,
  "data": { "id": 901, "rating": 5, "comment": "Excellent service..." }
}
```

---

## Technical Standards
- **Token**: Passing `Authorization: Bearer <TOKEN>` is mandatory for 90% of endpoints.
- **Nulls**: Use `null` for empty fields (e.g., `locationLat` if `isOnSite` is false).
- **Date**: Always use **ISO 8601** strings.
- **Images**: Combine API path (e.g., `/uploads/img.jpg`) with Host (e.g., `https://qirb.com`).
