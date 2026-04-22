# Qirb Garage Platform: Comprehensive API Specification (Non-Admin)

This document provides detailed parameter definitions, request shapes, and response structures for integrating the Qirb mobile ecosystem.

---

## 1. Authentication & Profile Management

### 👤 Register Customer
- **Endpoint**: `POST /auth/register`
- **Security**: Public
- **Parameters (Body)**:
| Parameter | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `fullName` | String | Yes | User's legal name |
| `email` | String | Yes | Valid email address |
| `password` | String | Yes | Minimum 8 characters |
| `phoneNumber` | String | Yes | Phone with country code (e.g., +251...) |
| `role` | String | Yes | Must be `"User"` for customers |

### 🛠️ Register Spare Seller (Multi-part)
- **Endpoint**: `POST /auth/register/spare-seller`
- **Security**: Public
- **Content-Type**: `multipart/form-data`
- **Parameters (Body)**:
| Parameter | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `fullName` | String | Yes | Seller's name |
| `shopName` | String | Yes | Business name |
| `city` | String | Yes | e.g., Addis Ababa |
| `verificationDoc` | File | Yes | Identity or License document |
| `shopPhotos` | File | Optional | Photos of the storefront |
| `delivers` | Boolean | Yes | "true" or "false" |
| `categories` | JSON String | Yes | e.g. `["Engine", "Body"]` |

---

## 2. Garage Discovery (Customer)

### 📍 Search Nearby Garages
- **Endpoint**: `GET /garages/nearby`
- **Security**: Public
- **Parameters (Query)**:
| Parameter | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `lat` | Float | Yes | User's current Latitude |
| `lng` | Float | Yes | User's current Longitude |

### 📅 Create Service Booking
- **Endpoint**: `POST /bookings`
- **Security**: Protected (Customer)
- **Parameters (Body)**:
| Parameter | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `garageId` | Integer | Yes | The ID of the target garage |
| `vehicleInfo` | String | Yes | e.g. "Toyota Hilux 2018 White" |
| `scheduledAt` | ISO Date | Yes | e.g. "2026-05-20T10:00:00Z" |
| `isOnSite` | Boolean | Yes | `true` for Mobile Mechanic, `false` for Shop |
| `locationLat` | Float | Optional | Required if `isOnSite` is true |
| `locationLng` | Float | Optional | Required if `isOnSite` is true |
| `locationAddress`| String | Optional | Text description of the location |
| `customerFeedback`| String | Optional | Client's notes or issue description |

---

## 3. Garage Operations (Owner)

### 🚥 Manage Active Bookings
- **Update Status**: `PUT /garage-owner/bookings/:id/status`
- **Assign Staff**: `PUT /garage-owner/bookings/:id/assign`
- **Parameters (Body)**:
| Parameter | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `status` | String | Optional | `ACCEPTED`, `REJECTED`, `COMPLETED` |
| `staffId` | Integer | Optional | The ID of the staff member to assign |

### 👷 Staff Directory
- **Add Staff**: `POST /garage-owner/staff`
- **Parameters (Body)**:
| Parameter | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `fullName` | String | Yes | Staff member's name |
| `email` | String | Yes | Credentials for staff login |
| `specialization` | String | Yes | e.g. "Electrician", "Bodywork" |

---

## 4. Spare Parts Marketplace

### 📤 List Part for Sale (Seller)
- **Endpoint**: `POST /spare-parts`
- **Security**: Protected (Seller/Owner)
- **Parameters (Body)**:
| Parameter | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | Yes | Item title |
| `price` | Float | Yes | Price in ETB |
| `category` | String | Yes | e.g. "Engine", "Brakes" |
| `condition` | String | Yes | "New" or "Used" |
| `vehicleModel` | String | Yes | e.g. "Toyota Corolla" |

### 🛒 Request Spare Part (Customer)
- **Endpoint**: `POST /spare-part-requests`
- **Parameters (Body)**:
| Parameter | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `spareId` | Integer | Yes | ID of the linked spare part |
| `quantity` | Integer | Yes | Default: 1 |
| `notes` | String | Optional | Custom request details |

---

## 5. Technical Response standards

### Success Wrapper
```json
{
  "success": true,
  "count": 10, // Included for list responses
  "data": { ... } // Single object or Array
}
```

### Error Wrapper
```json
{
  "success": false,
  "message": "Specific error explanation"
}
```

> [!TIP]
> **Pagination**: For large lists (Garages, Parts), use `?page=1&limit=20` to optimize data usage over mobile networks.
