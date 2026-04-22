# Mock Data Implementation Guide

## 🎯 Overview

The app now includes a **mock authentication system** that allows you to test the UI without a backend. You can easily switch between mock and real data in **one place**.

## ✅ What's Implemented

### Mock Authentication Service
- **File**: `lib/src/services/mock_auth_service.dart`
- Simulates login, signup, forgot password, and logout
- Includes network delay simulation (1.5 seconds)
- Maintains auth state
- Provides test users

### Feature Flags System
- **File**: `lib/src/config/feature_flags.dart`
- Central configuration for all mock features
- Easy on/off switches
- Production readiness checker

### Service Factory
- **File**: `lib/src/services/auth_service_factory.dart`
- Automatically provides mock or real service
- Based on feature flags
- No code changes needed in other files

## 🔑 Test Credentials

### Mock Users Available

| Role | Email | Password |
|------|-------|----------|
| Regular User | `user@test.com` | `password123` |
| Admin | `admin@test.com` | `admin123` |
| Garage Owner | `owner@test.com` | `owner123` |

## 🚀 How to Use

### Using Mock Data (Current Setup)

The app is currently configured to use mock data. Just run the app and use the test credentials above.

```bash
flutter run
```

### Switching to Real Backend

**Option 1: Change Feature Flag (Recommended)**

1. Open `lib/src/config/feature_flags.dart`
2. Change this line:
   ```dart
   static const bool useMockAuth = true;  // Change to false
   ```
3. Hot restart the app (press `R` in terminal)

**Option 2: Environment-Based (Advanced)**

You can also make it environment-dependent:

```dart
// In feature_flags.dart
static const bool useMockAuth = bool.fromEnvironment('USE_MOCK_AUTH', defaultValue: false);
```

Then run with:
```bash
flutter run --dart-define=USE_MOCK_AUTH=true  # For mock
flutter run --dart-define=USE_MOCK_AUTH=false # For real
```

## 📁 File Structure

```
lib/src/
├── config/
│   └── feature_flags.dart          ✨ Central configuration
├── services/
│   ├── auth_service.dart           📡 Real backend service
│   ├── mock_auth_service.dart      🎭 Mock service
│   └── auth_service_factory.dart   🏭 Factory to switch between them
├── features/auth/
│   └── data/repositories/
│       └── auth_repository_impl.dart  ♻️ Uses factory (no changes needed)
└── shared/widgets/
    └── mock_data_banner.dart       🎨 Visual indicator (optional)
```

## 🎨 Visual Indicators (Optional)

### Mock Data Banner

Add a visual indicator when using mock data:

```dart
// In your main app widget or login screen
import 'package:qirb_garage/src/shared/widgets/mock_data_banner.dart';

MockDataBanner(
  child: YourScreen(),
)
```

### Mock Data Info Dialog

Show test credentials to users:

```dart
import 'package:qirb_garage/src/shared/widgets/mock_data_banner.dart';

// Show dialog
MockDataInfoDialog.show(context);
```

## 🔄 How It Works

### Architecture

```
┌─────────────────────────────────────┐
│     Feature Flags Configuration     │
│   (lib/src/config/feature_flags.dart)│
└──────────────┬──────────────────────┘
               │
               ↓
┌──────────────────────────────────────┐
│      Auth Service Factory            │
│  (lib/src/services/auth_service_     │
│   factory.dart)                      │
│                                      │
│  if (useMockAuth)                    │
│    → MockAuthService                 │
│  else                                │
│    → AuthService (Real)              │
└──────────────┬───────────────────────┘
               │
               ↓
┌──────────────────────────────────────┐
│    Auth Repository Implementation    │
│  (Uses factory - no changes needed)  │
└──────────────┬───────────────────────┘
               │
               ↓
┌──────────────────────────────────────┐
│         Auth Controller              │
│    (No changes needed)               │
└──────────────┬───────────────────────┘
               │
               ↓
┌──────────────────────────────────────┐
│         UI Screens                   │
│    (No changes needed)               │
└──────────────────────────────────────┘
```

### Key Points

1. **Single Point of Control**: Change `FeatureFlags.useMockAuth` to switch
2. **No Code Changes**: UI and business logic remain unchanged
3. **Type Safe**: Both services implement the same interface
4. **Easy Testing**: Switch between mock and real for testing

## 🧪 Testing Scenarios

### Test Login Flow

1. Run the app
2. Navigate to login screen
3. Enter: `user@test.com` / `password123`
4. Click "Sign In"
5. Wait 1.5 seconds (simulated network delay)
6. Should navigate to home screen

### Test Sign Up Flow

1. Navigate to sign up screen
2. Enter any name, email, and password
3. Click "Create Account"
4. Wait 1.5 seconds
5. Should navigate to home screen

### Test Forgot Password

1. Navigate to forgot password screen
2. Enter: `user@test.com`
3. Click "Send Reset Link"
4. Wait 1.5 seconds
5. Should show success message

### Test Invalid Credentials

1. Navigate to login screen
2. Enter: `wrong@test.com` / `wrongpass`
3. Click "Sign In"
4. Should show error: "Invalid email or password"

## ⚙️ Configuration Options

### Feature Flags Available

```dart
// In lib/src/config/feature_flags.dart

class FeatureFlags {
  // Authentication
  static const bool useMockAuth = true;
  
  // Other features (for future use)
  static const bool useMockGarages = true;
  static const bool useMockBookings = true;
  static const bool useMockProfile = true;
  
  // Debug settings
  static const bool enableDebugLogging = true;
  static const int mockNetworkDelay = 1500; // milliseconds
}
```

### Customizing Mock Data

Edit `lib/src/services/mock_auth_service.dart`:

```dart
// Add more test users
static final List<Map<String, dynamic>> _mockUsers = [
  {
    'id': 1,
    'fullName': 'Your Name',
    'email': 'your@email.com',
    'password': 'yourpassword',
    'phoneNumber': '+1234567890',
    'role': 'User',
    // ... more fields
  },
  // Add more users...
];
```

### Adjusting Network Delay

```dart
// In mock_auth_service.dart
static const int _networkDelay = 1500; // Change this value
```

Or in feature flags:
```dart
// In feature_flags.dart
static const int mockNetworkDelay = 1500; // Change this value
```

## 🚀 Production Deployment

### Pre-Deployment Checklist

1. **Disable All Mock Features**
   ```dart
   // In feature_flags.dart
   static const bool useMockAuth = false;
   static const bool useMockGarages = false;
   static const bool useMockBookings = false;
   static const bool useMockProfile = false;
   ```

2. **Verify Production Readiness**
   ```dart
   // Check this returns true
   FeatureFlags.isProductionReady
   ```

3. **Remove Mock Data Banner** (if added)
   - Remove `MockDataBanner` wrapper from screens
   - Remove `MockDataInfoDialog` calls

4. **Test with Real Backend**
   - Ensure backend URL is correct in `.env`
   - Test all authentication flows
   - Verify error handling

5. **Build for Release**
   ```bash
   flutter build apk --release
   # or
   flutter build ios --release
   ```

## 🔍 Debugging

### Check Current Configuration

Add this to your app initialization:

```dart
// In main.dart or app.dart
if (kDebugMode) {
  print(FeatureFlags.configSummary);
}
```

Output:
```
Feature Flags Configuration:
  - Mock Auth: ENABLED
  - Mock Garages: ENABLED
  - Mock Bookings: ENABLED
  - Mock Profile: ENABLED
  - Debug Logging: ENABLED
  - Network Delay: 1500ms
  - Production Ready: NO
```

### Common Issues

**Issue**: Login not working
- **Check**: Is `useMockAuth` set correctly?
- **Check**: Are you using correct test credentials?
- **Check**: Check console for error messages

**Issue**: No network delay
- **Check**: `mockNetworkDelay` value in feature flags
- **Check**: Mock service is being used (not real service)

**Issue**: Can't switch to real backend
- **Check**: Did you hot restart (not just hot reload)?
- **Check**: Is backend URL correct in `.env`?
- **Check**: Is backend server running?

## 📝 Adding More Mock Features

### Example: Mock Garage Service

1. **Create Mock Service**
   ```dart
   // lib/src/services/mock_garage_service.dart
   class MockGarageService {
     static final List<Garage> _mockGarages = [
       // Your mock data
     ];
     
     FutureEither<List<Garage>> getNearbyGarages() async {
       await Future.delayed(Duration(milliseconds: 1500));
       return right(_mockGarages);
     }
   }
   ```

2. **Add Feature Flag**
   ```dart
   // In feature_flags.dart
   static const bool useMockGarages = true;
   ```

3. **Create Factory**
   ```dart
   // lib/src/services/garage_service_factory.dart
   class GarageServiceFactory {
     static dynamic get instance {
       if (FeatureFlags.useMockGarages) {
         return MockGarageService.instance;
       } else {
         return GarageService.instance;
       }
     }
   }
   ```

4. **Use in Repository**
   ```dart
   final _garageService = GarageServiceFactory.instance;
   ```

## 🎉 Benefits

### For Development
- ✅ Test UI without backend
- ✅ Faster development cycle
- ✅ No network dependency
- ✅ Consistent test data
- ✅ Easy to reproduce bugs

### For Testing
- ✅ Predictable test scenarios
- ✅ No API rate limits
- ✅ Offline testing
- ✅ Fast test execution
- ✅ Isolated testing

### For Production
- ✅ Easy to switch to real backend
- ✅ No mock code in production (if removed)
- ✅ Clean separation of concerns
- ✅ Type-safe implementation

## 📚 Related Files

- `lib/src/config/feature_flags.dart` - Configuration
- `lib/src/services/mock_auth_service.dart` - Mock implementation
- `lib/src/services/auth_service_factory.dart` - Service factory
- `lib/src/services/auth_service.dart` - Real implementation
- `lib/src/shared/widgets/mock_data_banner.dart` - Visual indicators

## 🤝 Contributing

When adding new features:
1. Create mock service if needed
2. Add feature flag
3. Create factory
4. Update this documentation

## ✅ Summary

- **Current State**: Using mock authentication
- **Test Users**: 3 predefined users (see table above)
- **Switch Method**: Change `FeatureFlags.useMockAuth`
- **Production Ready**: Set all flags to `false`
- **Easy Removal**: Delete mock files when ready

---

**Status**: ✅ Mock Data Active  
**Switch Location**: `lib/src/config/feature_flags.dart`  
**Test Credentials**: See table above  
**Production Ready**: Change flags to `false`
