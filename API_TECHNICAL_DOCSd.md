# Qirb Master API Index: Mobile Developer Guide

This index provides an exhaustive list of every endpoint available to non-admin users (Customers, Garage Owners, Staff, and Sellers).

---

## 🟢 Module 1: Public Endpoints (No Token Required)

These endpoints are used for landing pages, discovery, and the initial authentication handshake.

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/auth/login` | `POST` | Authenticates user and returns JWT |
| `/auth/register` | `POST` | Registers a new Customer |
| `/auth/register/spare-seller` | `POST` | Registers a Seller (Multipart) |
| `/auth/google` | `POST` | Google OAuth verification |
| `/garages` | `GET` | List all verified garages |
| `/garages/nearby` | `GET` | Geo-sorted list of garages (`?lat=X&lng=Y`) |
| `/garages/:id` | `GET` | Detailed profile of a specific garage |
| `/spare-parts` | `GET` | Global marketplace catalog |
| `/spare-parts/:id` | `GET` | Detailed view of a single part |
| `/manuals` | `GET` | Browse open-access technical guides |
| `/lookups/cities` | `GET` | List of supported service cities |
| `/lookups/vehicle-types`| `GET` | Supported makes/models for dropdowns |
| `/reviews/garage/:id` | `GET` | Public review history for a garage |

---

## 🔵 Module 2: Global Service Hooks (Authenticated - All Roles)

Used by the mobile app's shell for core functionality like messaging and sync.

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/auth/me` | `GET` | Refresh user context and check roles |
| `/notifications/unread-counts` | `GET` | Global badge counts for the bottom nav |
| `/messages/conversations` | `GET` | List all active chat threads |
| `/messages/:convoId/messages` | `GET` | Fetch message history for a chat |
| `/messages/send` | `POST` | Send a direct message |
| `/messages/initiate` | `POST` | Start a chat from a profile/part view |
| `/manuals` | `GET` | Fetch all manuals (including premium metadata) |

---

## 🟠 Module 3: Customer Role Endpoints (`User`)

Endpoints specifically for vehicle owners and marketplace buyers.

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/bookings` | `POST` | Submit a new service request |
| `/bookings/my` | `GET` | View booking history and active work |
| `/bookings/:id/status` | `PUT` | Cancel a pending request (`{status: 'CANCELLED'}`) |
| `/spare-part-requests` | `POST` | Submit a direct inquiry to a seller |
| `/spare-part-requests/my`| `GET` | Track my marketplace inquiries |
| `/reviews` | `POST` | Submit rating/comment for a completed job |
| `/saved-garages` | `GET` | List user's bookmarked garages |
| `/saved-garages` | `POST` | Bookmark a garage (`{garageId: X}`) |

---

## 🟣 Module 4: Garage Owner Role Endpoints (`GarageOwner`)

Focuses on business management and resource allocation.

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/applications` | `POST` | Apply for garage verification (Identity/Doc upload) |
| `/applications/status` | `GET` | Check if current garage is APPROVED/PENDING |
| `/garage-owner/stats` | `GET` | Revenue and volume metrics for dashboard |
| `/garage-owner/bookings` | `GET` | Full queue of incoming service requests |
| `/garage-owner/bookings/:id/status` | `PUT` | ACCEPT or REJECT incoming requests |
| `/garage-owner/bookings/:id/assign` | `PUT` | Assign a Staff ID to a specific job |
| `/garage-owner/staff` | `GET` | List all mechanics in your shop |
| `/garage-owner/staff` | `POST` | Onboard a new staff member |
| `/garage-owner/services` | `GET` | Your garage's service catalog |
| `/garage-owner/services/:id` | `PUT` | Toggle availability or change pricing |

---

## 🛠️ Module 5: Workshop Staff Role Endpoints (`Staff`)

Operational endpoints for mechanics on the shop floor.

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/staff-dashboard/jobs` | `GET` | List of jobs specifically assigned to this staff |
| `/staff-dashboard/jobs/:id/status`| `PUT` | Update lifecycle (EN_ROUTE -> IN_PROGRESS -> COMPLETE) |

---

## 📦 Module 6: Marketplace Seller Endpoints (`SparePartSeller`)

Inventory and inquiry management for part dealers.

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/spare-parts/my` | `GET` | Your active inventory list |
| `/spare-parts` | `POST` | List a new component for sale |
| `/spare-parts/:id` | `PUT` | Update price/details of stock |
| `/spare-requests/seller` | `GET` | View incoming buyer inquiries |
| `/spare-requests/:id/status`| `PUT` | REJECT or ACCEPT a buyer's inquiry |

---

## 🛑 Response & Security Standards

### Authorization
All endpoints in Modules 2-6 require the following header:
`Authorization: Bearer <JWT_FROM_LOGIN>`

### Image/File Handling
Prefix all relative paths (e.g., `/uploads/file.png`) with your host:
`https://api.qirb.com` + `path_returned_by_api`

### Error Handling
Mobile apps must handle the following standard JSON error response:
```json
{
    "success": false,
    "message": "User-friendly error message from backend"
}
```
