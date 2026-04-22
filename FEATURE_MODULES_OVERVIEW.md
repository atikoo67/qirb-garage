# Qirb Garage - Feature Modules Overview

## 🏗️ Architecture Visualization

```
┌─────────────────────────────────────────────────────────────┐
│                    QIRB GARAGE MOBILE APP                   │
│                   Clean Architecture Pattern                 │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
        ┌─────────────────────────────────────────┐
        │         ROLE-BASED ROUTING              │
        │    (Based on JWT Token User Role)       │
        └─────────────────────────────────────────┘
                              │
        ┌─────────────────────┴─────────────────────┐
        │                                           │
        ▼                                           ▼
┌───────────────┐                          ┌───────────────┐
│   CUSTOMER    │                          │ GARAGE OWNER  │
│    MODULE     │                          │    MODULE     │
└───────────────┘                          └───────────────┘
        │                                           │
        ▼                                           ▼
┌───────────────┐                          ┌───────────────┐
│     STAFF     │                          │    SELLER     │
│    MODULE     │                          │    MODULE     │
└───────────────┘                          └───────────────┘
```

## 📱 Module Breakdown

### 🔐 Core Modules (All Roles)

#### 1. Authentication Module
```
auth/
├── Login
├── Registration
├── Password Recovery
└── Session Management
```
**Users**: All  
**Key Features**: JWT authentication, secure token storage

#### 2. Profile Module
```
profile/
├── View Profile
├── Edit Profile
├── Change Password
└── Settings
```
**Users**: All  
**Key Features**: Profile management, account settings

#### 3. Messaging Module
```
messaging/
├── Conversations List
├── Chat Interface
├── Real-time Messages
└── Message Notifications
```
**Users**: All  
**Key Features**: Real-time chat, conversation management

#### 4. Notifications Module
```
notifications/
├── Notification List
├── Mark as Read
├── Notification Details
└── Push Notifications
```
**Users**: All  
**Key Features**: Push notifications, in-app alerts

---

### 👤 Customer Module

```
customer/
├── Garage Discovery
│   ├── Search by Location
│   ├── Filter by Specialty
│   ├── Sort by Rating
│   └── View on Map
│
├── Service Booking
│   ├── Select Garage
│   ├── Enter Vehicle Details
│   ├── Choose Service Type
│   ├── Schedule Appointment
│   └── Track Booking Status
│
├── Spare Parts Marketplace
│   ├── Browse Parts
│   ├── Search by Ref Number
│   ├── Filter by Condition
│   ├── Submit Inquiry
│   └── Track Requests
│
└── Technical Library
    ├── Browse Manuals
    ├── Search Documents
    ├── View PDF/Documents
    └── Bookmark Resources
```

**Primary Goal**: Frictionless discovery and service management

**Key Screens**:
- Garage List Screen
- Garage Detail Screen
- Create Booking Screen
- My Bookings Screen
- Spare Parts List Screen
- Spare Part Detail Screen
- Technical Library Screen

---

### 🏢 Garage Owner Module

```
garage_owner/
├── Command Center Dashboard
│   ├── Active Bookings Overview
│   ├── Staff Workload Monitor
│   ├── Revenue Statistics
│   └── Performance Metrics
│
├── Booking Management
│   ├── View All Bookings
│   ├── Accept/Reject Requests
│   ├── Assign Staff
│   ├── Track Progress
│   └── Complete Jobs
│
├── Staff Management
│   ├── View Staff List
│   ├── Assign Tasks
│   ├── Monitor Performance
│   └── Manage Schedules
│
└── Garage Profile
    ├── Edit Garage Info
    ├── Update Services
    ├── Manage Photos
    └── Set Availability
```

**Primary Goal**: Operational oversight and personnel management

**Key Screens**:
- Owner Dashboard Screen
- All Bookings Screen
- Staff Management Screen
- Assign Staff Dialog
- Garage Profile Screen

---

### 🔧 Staff Module (Mechanics)

```
staff/
├── Staff Dashboard
│   ├── Today's Assignments
│   ├── Pending Jobs
│   ├── In-Progress Jobs
│   └── Completed Jobs
│
├── Job Management
│   ├── View Job Details
│   ├── Accept Assignment
│   ├── Update Status
│   │   ├── ACCEPTED
│   │   ├── IN_PROGRESS
│   │   └── COMPLETED
│   ├── Add Notes
│   └── Report Issues
│
└── Technical Resources
    ├── Access Manuals
    ├── Search by Vehicle
    └── Quick Reference
```

**Primary Goal**: Workshop efficiency and real-time execution

**Key Screens**:
- Staff Dashboard Screen
- Assigned Jobs Screen
- Job Detail Screen
- Status Update Screen
- Technical Docs Screen

---

### 🛒 Seller Module

```
seller/
├── Seller Dashboard
│   ├── Inventory Overview
│   ├── Pending Inquiries
│   ├── Sales Statistics
│   └── Recent Activity
│
├── Inventory Management
│   ├── My Parts List
│   ├── Add New Part
│   ├── Edit Part Details
│   ├── Update Stock
│   └── Delete Part
│
├── Inquiry Management
│   ├── View Inquiries
│   ├── Respond to Requests
│   ├── Quote Prices
│   └── Track Status
│
└── Sales Tracking
    ├── Completed Sales
    ├── Revenue Reports
    └── Customer Feedback
```

**Primary Goal**: Inventory velocity and inquiry response

**Key Screens**:
- Seller Dashboard Screen
- My Inventory Screen
- Add/Edit Part Screen
- Inquiries Screen
- Inquiry Detail Screen

---

## 🔄 Shared Features

### Garage Discovery (Used by Customer)
```
garage/
├── domain/
│   ├── entities/
│   │   └── garage.dart
│   ├── repositories/
│   │   └── garage_repository.dart
│   └── usecases/
│       ├── get_garages_usecase.dart
│       ├── search_garages_usecase.dart
│       └── get_garage_by_id_usecase.dart
├── data/
│   ├── datasources/
│   │   └── garage_remote_datasource.dart
│   ├── models/
│   │   └── garage_model.dart
│   └── repositories/
│       └── garage_repository_impl.dart
└── presentation/
    ├── providers/
    │   └── garage_provider.dart
    ├── screens/
    │   ├── garage_list_screen.dart
    │   └── garage_detail_screen.dart
    └── widgets/
        ├── garage_card.dart
        └── garage_map.dart
```

### Booking Management (Used by Customer, Owner, Staff)
```
booking/
├── domain/
│   ├── entities/
│   │   └── booking.dart
│   ├── repositories/
│   │   └── booking_repository.dart
│   └── usecases/
│       ├── create_booking_usecase.dart
│       ├── get_bookings_usecase.dart
│       └── update_booking_status_usecase.dart
├── data/
│   ├── datasources/
│   │   └── booking_remote_datasource.dart
│   ├── models/
│   │   └── booking_model.dart
│   └── repositories/
│       └── booking_repository_impl.dart
└── presentation/
    ├── providers/
    │   └── booking_provider.dart
    ├── screens/
    │   ├── create_booking_screen.dart
    │   ├── booking_list_screen.dart
    │   └── booking_detail_screen.dart
    └── widgets/
        ├── booking_card.dart
        └── status_badge.dart
```

### Spare Parts (Used by Customer, Seller)
```
spare_parts/
├── domain/
│   ├── entities/
│   │   └── spare_part.dart
│   ├── repositories/
│   │   └── spare_part_repository.dart
│   └── usecases/
│       ├── get_spare_parts_usecase.dart
│       ├── create_spare_part_usecase.dart
│       └── search_spare_parts_usecase.dart
├── data/
│   ├── datasources/
│   │   └── spare_part_remote_datasource.dart
│   ├── models/
│   │   └── spare_part_model.dart
│   └── repositories/
│       └── spare_part_repository_impl.dart
└── presentation/
    ├── providers/
    │   └── spare_part_provider.dart
    ├── screens/
    │   ├── spare_part_list_screen.dart
    │   └── spare_part_detail_screen.dart
    └── widgets/
        ├── spare_part_card.dart
        └── condition_badge.dart
```

---

## 🎯 User Journey Flows

### Customer Journey
```
1. Login/Register
   ↓
2. Browse Garages (by location/specialty)
   ↓
3. Select Garage & View Details
   ↓
4. Create Booking (vehicle info + service type)
   ↓
5. Track Booking Status
   ↓
6. Browse Spare Parts (optional)
   ↓
7. Submit Part Inquiry (optional)
   ↓
8. Access Technical Library (optional)
```

### Garage Owner Journey
```
1. Login
   ↓
2. View Dashboard (active bookings, staff status)
   ↓
3. Review New Booking Requests
   ↓
4. Assign Staff to Bookings
   ↓
5. Monitor Job Progress
   ↓
6. Manage Garage Profile
```

### Staff Journey
```
1. Login
   ↓
2. View Assigned Jobs
   ↓
3. Accept Assignment
   ↓
4. Update Status to IN_PROGRESS
   ↓
5. Access Technical Docs (if needed)
   ↓
6. Complete Job & Update Status
```

### Seller Journey
```
1. Login
   ↓
2. View Dashboard (inventory, inquiries)
   ↓
3. Manage Inventory (add/edit parts)
   ↓
4. Review Customer Inquiries
   ↓
5. Respond with Quotes
   ↓
6. Track Sales
```

---

## 📊 Module Dependencies

```
┌─────────────┐
│    Auth     │ ◄─── Required by all modules
└─────────────┘

┌─────────────┐
│  Messaging  │ ◄─── Used by all roles
└─────────────┘

┌─────────────┐
│Notifications│ ◄─── Used by all roles
└─────────────┘

┌─────────────┐      ┌─────────────┐
│   Garage    │ ◄────│  Customer   │
└─────────────┘      └─────────────┘

┌─────────────┐      ┌─────────────┐
│   Booking   │ ◄────│  Customer   │
└─────────────┘      │Garage Owner │
                     │    Staff    │
                     └─────────────┘

┌─────────────┐      ┌─────────────┐
│ Spare Parts │ ◄────│  Customer   │
└─────────────┘      │   Seller    │
                     └─────────────┘

┌─────────────┐      ┌─────────────┐
│  Technical  │ ◄────│  Customer   │
│   Library   │      │    Staff    │
└─────────────┘      └─────────────┘
```

---

## 🎨 UI Component Hierarchy

### Shared Widgets (lib/src/shared/widgets/)
```
├── buttons/
│   ├── primary_button.dart
│   ├── secondary_button.dart
│   └── icon_button.dart
│
├── inputs/
│   ├── custom_text_field.dart
│   ├── search_bar.dart
│   └── dropdown_field.dart
│
├── cards/
│   ├── info_card.dart
│   └── list_card.dart
│
├── indicators/
│   ├── loading_indicator.dart
│   ├── status_badge.dart
│   └── rating_widget.dart
│
└── layouts/
    ├── empty_state.dart
    ├── error_widget.dart
    └── list_skeleton.dart
```

---

## 🔐 Security & Permissions

### Required Permissions by Module

**Customer Module**:
- 📍 Location (for garage discovery)
- 📷 Camera (for profile photo)
- 📁 Storage (for documents)

**Garage Owner Module**:
- 📷 Camera (for garage photos)
- 📁 Storage (for documents)

**Staff Module**:
- 📷 Camera (for job photos)
- 📁 Storage (for technical docs)

**Seller Module**:
- 📷 Camera (for part photos)
- 📁 Storage (for documents)

---

## 📈 Implementation Priority

### Phase 1: MVP (Minimum Viable Product)
1. ✅ Auth Module
2. ✅ Customer Module (Garage Discovery + Booking)
3. ✅ Basic Messaging

### Phase 2: Core Features
4. ✅ Garage Owner Module
5. ✅ Staff Module
6. ✅ Notifications

### Phase 3: Extended Features
7. ✅ Seller Module
8. ✅ Spare Parts Marketplace
9. ✅ Technical Library

### Phase 4: Polish
10. ✅ Profile & Settings
11. ✅ Advanced Search & Filters
12. ✅ Analytics & Reporting

---

**This overview provides a comprehensive map of all feature modules and their relationships in the Qirb Garage mobile application.**
