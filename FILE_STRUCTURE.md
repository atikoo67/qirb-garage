# Qirb Garage Mobile App - File Structure

This document outlines the complete file structure for the Qirb Garage mobile application, following Clean Architecture principles.

## Architecture Overview

The app follows **Clean Architecture** with three main layers:

1. **Domain Layer**: Business logic, entities, and repository interfaces
2. **Data Layer**: Data sources, models, and repository implementations
3. **Presentation Layer**: UI, state management, and user interactions

## Directory Structure

```
lib/
├── main.dart                          # App entry point
└── src/
    ├── app.dart                       # Main app widget
    ├── flavors.dart                   # Environment flavors
    │
    ├── config/                        # App configuration
    │   └── app_config.dart
    │
    ├── routing/                       # Navigation & routing
    │   ├── app_router.dart
    │   ├── app_routes.dart
    │   └── global_navigator.dart
    │
    ├── theme/                         # App theming
    │   ├── color_schemes.dart
    │   ├── text_theme.dart
    │   ├── app_borders.dart
    │   ├── app_curves.dart
    │   ├── app_durations.dart
    │   ├── app_shadows.dart
    │   ├── app_spacing.dart
    │   ├── theme_constants.dart
    │   └── theme.dart
    │
    ├── services/                      # Global services
    │   ├── auth_service.dart
    │   ├── dio_service.dart
    │   ├── storage_service.dart
    │   ├── secure_storage_service.dart
    │   ├── location_service.dart
    │   ├── media_service.dart
    │   ├── permission_service.dart
    │   ├── internet_connection_service.dart
    │   ├── device_info_service.dart
    │   ├── path_service.dart
    │   ├── url_launcher_service.dart
    │   ├── version_update_service.dart
    │   ├── copy_service.dart
    │   └── services.dart
    │
    ├── utils/                         # Utility functions
    │   ├── app_utils.dart
    │   ├── debouncer.dart
    │   ├── error_handler.dart
    │   ├── failure.dart
    │   ├── input_formatters.dart
    │   ├── logger.dart
    │   ├── platform_info.dart
    │   ├── task_runner.dart
    │   ├── typedefs.dart
    │   └── utils.dart
    │
    ├── extensions/                    # Dart extensions
    │   ├── collection_extension.dart
    │   ├── context_extension.dart
    │   ├── date_time_extension.dart
    │   ├── num_extension.dart
    │   ├── string_extension.dart
    │   ├── widget_extension.dart
    │   └── extensions.dart
    │
    ├── shared/                        # Shared resources
    │   ├── app_assets.dart
    │   ├── shared.dart
    │   │
    │   ├── constants/
    │   │   ├── api_constants.dart     # API endpoints
    │   │   └── app_constants.dart     # App-wide constants
    │   │
    │   ├── enums/
    │   │   ├── user_role.dart
    │   │   ├── booking_status.dart
    │   │   └── spare_part_condition.dart
    │   │
    │   ├── widgets/                   # Reusable widgets
    │   ├── helpers/                   # Helper functions
    │   ├── hooks/                     # Custom hooks
    │   └── wrappers/                  # Widget wrappers
    │
    ├── imports/                       # Centralized imports
    │   ├── core_imports.dart
    │   ├── packages_imports.dart
    │   └── imports.dart
    │
    └── features/                      # Feature modules
        │
        ├── auth/                      # Authentication
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   │   └── user_model.dart
        │   │   └── repositories/
        │   │       └── auth_repository_impl.dart
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── user.dart
        │   │   ├── repositories/
        │   │   │   └── auth_repository.dart
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       │   ├── auth_provider.dart
        │       │   └── session_provider.dart
        │       ├── screens/
        │       │   ├── login_screen.dart
        │       │   ├── signup_screen.dart
        │       │   └── forgot_password_screen.dart
        │       └── widgets/
        │
        ├── onboarding/                # Onboarding flow
        │   └── presentation/
        │       └── screens/
        │           └── onboarding_page.dart
        │
        ├── home/                      # Home dashboard
        │   └── presentation/
        │       └── screens/
        │           └── home_page.dart
        │
        ├── customer/                  # Customer module
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── garage_owner/              # Garage Owner module
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── staff/                     # Staff/Mechanic module
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── seller/                    # Spare Part Seller module
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── garage/                    # Garage discovery & details
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── garage.dart
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── booking/                   # Service bookings
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── booking.dart
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── spare_parts/               # Spare parts marketplace
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── spare_part.dart
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── messaging/                 # Chat & messaging
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── message.dart
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── notifications/             # Notifications
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── notification.dart
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        ├── technical_library/         # Technical manuals
        │   ├── data/
        │   │   ├── datasources/
        │   │   ├── models/
        │   │   └── repositories/
        │   ├── domain/
        │   │   ├── entities/
        │   │   ├── repositories/
        │   │   └── usecases/
        │   └── presentation/
        │       ├── providers/
        │       ├── screens/
        │       └── widgets/
        │
        └── profile/                   # User profile
            ├── data/
            │   ├── datasources/
            │   ├── models/
            │   └── repositories/
            ├── domain/
            │   ├── entities/
            │   ├── repositories/
            │   └── usecases/
            └── presentation/
                ├── providers/
                ├── screens/
                └── widgets/
```

## Feature Modules

### 1. **Auth** (Authentication)
- Login, registration, password recovery
- JWT token management
- Session handling

### 2. **Customer Module**
- Garage discovery and search
- Service booking flow
- Spare parts browsing
- Technical library access

### 3. **Garage Owner Module**
- Command center dashboard
- Booking management
- Staff assignment
- Garage profile management

### 4. **Staff Module** (Mechanics)
- Assigned service requests
- Job status updates (ACCEPTED → IN_PROGRESS → COMPLETED)
- Technical documentation access

### 5. **Seller Module**
- Spare parts catalog management
- Inquiry handling
- Sales tracking

### 6. **Garage** (Discovery)
- Search garages by location, specialty, rating
- View garage details
- Check availability

### 7. **Booking**
- Create service bookings
- Track booking status
- View booking history

### 8. **Spare Parts**
- Browse spare parts catalog
- Filter by condition (New/Used)
- Submit inquiry requests

### 9. **Messaging**
- Real-time chat
- Conversation management
- Message notifications

### 10. **Notifications**
- Push notifications
- In-app notifications
- Notification history

### 11. **Technical Library**
- Vehicle service manuals
- Technical documentation
- Search and filter

### 12. **Profile**
- User profile management
- Settings
- Account information

## Clean Architecture Layers

### Domain Layer (`domain/`)
- **Entities**: Pure business objects (e.g., `User`, `Garage`, `Booking`)
- **Repositories**: Abstract interfaces defining data operations
- **Use Cases**: Business logic and application rules

### Data Layer (`data/`)
- **Data Sources**: API clients, local storage
- **Models**: Data transfer objects with JSON serialization
- **Repositories**: Concrete implementations of domain repositories

### Presentation Layer (`presentation/`)
- **Providers**: State management using Riverpod
- **Screens**: Full-page UI components
- **Widgets**: Reusable UI components specific to the feature

## Key Files Created

### Environment Configuration
- `.env` - Environment variables (API URLs, feature flags)

### Shared Resources
- `lib/src/shared/enums/user_role.dart` - User role enumeration
- `lib/src/shared/enums/booking_status.dart` - Booking status enumeration
- `lib/src/shared/enums/spare_part_condition.dart` - Spare part condition
- `lib/src/shared/constants/api_constants.dart` - API endpoint constants
- `lib/src/shared/constants/app_constants.dart` - Application constants

### Domain Entities
- `lib/src/features/garage/domain/entities/garage.dart`
- `lib/src/features/booking/domain/entities/booking.dart`
- `lib/src/features/spare_parts/domain/entities/spare_part.dart`
- `lib/src/features/messaging/domain/entities/message.dart`
- `lib/src/features/notifications/domain/entities/notification.dart`

## Next Steps

1. **Implement Repository Interfaces**: Define contracts in `domain/repositories/`
2. **Create Use Cases**: Implement business logic in `domain/usecases/`
3. **Build Data Models**: Create JSON-serializable models in `data/models/`
4. **Implement Data Sources**: Build API clients in `data/datasources/`
5. **Create Repository Implementations**: Implement repositories in `data/repositories/`
6. **Build UI Screens**: Create screens in `presentation/screens/`
7. **Implement State Management**: Create providers in `presentation/providers/`
8. **Design Widgets**: Build reusable widgets in `presentation/widgets/`

## Development Guidelines

1. **Follow Clean Architecture**: Keep layers separated and dependencies pointing inward
2. **Use Dependency Injection**: Leverage Riverpod for DI
3. **Write Testable Code**: Each layer should be independently testable
4. **Maintain Consistency**: Follow the established patterns across all features
5. **Document Code**: Add comments for complex business logic
6. **Handle Errors**: Use the `Failure` class for error handling
7. **Validate Input**: Use input formatters and validators
8. **Optimize Performance**: Use pagination, caching, and lazy loading

## Role-Based Access

The app must route users to appropriate modules based on their role:

- **CUSTOMER** → Customer module (garage discovery, bookings, spare parts)
- **GARAGE_OWNER** → Garage Owner module (dashboard, staff management)
- **STAFF** → Staff module (assigned jobs, status updates)
- **SELLER** → Seller module (inventory, inquiries)

## API Integration

- Base URL: `http://localhost:5000/api` (development)
- Authentication: JWT Bearer tokens
- All protected endpoints require `Authorization: Bearer <TOKEN>` header
- Use `GET /auth/me` to verify active session and user role

---

**© 2026 Qirb Garage Platform. All rights reserved.**
