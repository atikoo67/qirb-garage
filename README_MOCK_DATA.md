# 🎭 Mock Data System - Quick Reference

## ✅ What's Implemented

A complete **mock authentication system** that lets you test the app without a backend. Switch between mock and real data in **one place**.

## 🔑 Test Credentials

| Email | Password | Role |
|-------|----------|------|
| `user@test.com` | `password123` | Regular User |
| `admin@test.com` | `admin123` | Admin |
| `owner@test.com` | `owner123` | Garage Owner |

## 🚀 Quick Start

### Run with Mock Data (Current Setup)

```bash
flutter run
```

Then login with any test credentials above.

### Switch to Real Backend

**One-line change:**

```dart
// File: lib/src/config/feature_flags.dart
static const bool useMockAuth = false;  // Change true → false
```

Then press `R` in terminal to hot restart.

## 📁 Key Files

| File | Purpose |
|------|---------|
| `lib/src/config/feature_flags.dart` | **⭐ Switch here** - Control mock/real |
| `lib/src/services/mock_auth_service.dart` | Mock implementation |
| `lib/src/services/auth_service_factory.dart` | Auto-selects service |
| `MOCK_DATA_GUIDE.md` | Complete documentation |

## 🎯 How It Works

```
┌─────────────────────────┐
│   Feature Flags         │
│   useMockAuth = true    │ ← Change this
└───────────┬─────────────┘
            │
            ↓
┌─────────────────────────┐
│   Service Factory       │
│   (Auto-selects)        │
└───────────┬─────────────┘
            │
     ┌──────┴──────┐
     ↓             ↓
┌─────────┐   ┌─────────┐
│  Mock   │   │  Real   │
│ Service │   │ Service │
└─────────┘   └─────────┘
```

## ✨ Features

- ✅ **3 test users** with different roles
- ✅ **Network delay simulation** (1.5 seconds)
- ✅ **Full auth flow** (login, signup, forgot password)
- ✅ **Error handling** (invalid credentials, existing email)
- ✅ **Auth state management** (login/logout)
- ✅ **One-place switch** (feature flags)
- ✅ **Type safe** (same interface as real service)

## 🧪 Test Scenarios

### ✅ Valid Login
```
Email: user@test.com
Password: password123
Result: ✅ Success → Navigate to home
```

### ❌ Invalid Login
```
Email: wrong@test.com
Password: wrongpass
Result: ❌ Error: "Invalid email or password"
```

### ✅ Sign Up
```
Name: Any name
Email: Any new email
Password: Any password (6+ chars)
Result: ✅ Success → Navigate to home
```

### ❌ Duplicate Email
```
Email: user@test.com (already exists)
Result: ❌ Error: "Email already exists"
```

### ✅ Forgot Password
```
Email: user@test.com
Result: ✅ Success → "Reset link sent"
```

## 🔧 Configuration

### Current Settings

```dart
// lib/src/config/feature_flags.dart

useMockAuth = true           // ✅ Using mock
useMockGarages = true        // Ready for future
useMockBookings = true       // Ready for future
useMockProfile = true        // Ready for future
enableDebugLogging = true    // Logs enabled
mockNetworkDelay = 1500      // 1.5s delay
```

### For Production

```dart
useMockAuth = false          // ❌ Use real backend
enableDebugLogging = false   // ❌ Disable logs
```

## 📚 Documentation

- **`MOCK_DATA_GUIDE.md`** - Complete guide with examples
- **`MOCK_DATA_SUMMARY.md`** - Implementation summary
- **`README_MOCK_DATA.md`** - This file (quick reference)

## 🎨 Optional: Visual Indicator

Show users they're using mock data:

```dart
// Add to login screen
import 'package:qirb_garage/src/config/feature_flags.dart';

if (FeatureFlags.useMockAuth) {
  // Show banner or info
  // See MOCK_DATA_GUIDE.md for full example
}
```

## ✅ Benefits

### For Development
- Work on UI without backend
- Fast iteration cycle
- No network dependency
- Consistent test data

### For Testing
- Predictable scenarios
- Offline testing
- Fast test execution
- Easy error simulation

### For Production
- Easy switch to real backend
- Clean separation
- Type-safe implementation
- No mock code in production

## 🚀 Production Checklist

Before deploying:

1. **Update `.env`**
   ```
   BASE_API_URL=https://your-api.com/api
   ```

2. **Disable mock features**
   ```dart
   // In feature_flags.dart
   useMockAuth = false
   ```

3. **Test with real backend**
   - Login with real credentials
   - Test all auth flows
   - Verify error handling

4. **Build release**
   ```bash
   flutter build apk --release
   ```

5. **Optional: Remove mock files**
   - `lib/src/services/mock_auth_service.dart`
   - `lib/src/services/auth_service_factory.dart`
   - `lib/src/shared/widgets/mock_data_banner.dart`

## 🐛 Troubleshooting

### Login not working?
- Check you're using correct test credentials
- Check `useMockAuth = true` in feature flags
- Check console for error messages

### Can't switch to real backend?
- Did you hot restart (not just hot reload)?
- Is backend URL correct in `.env`?
- Is backend server running?

### No network delay?
- Check `mockNetworkDelay` value
- Ensure mock service is being used

## 💡 Tips

1. **Check configuration on startup**
   ```dart
   // In main.dart
   if (kDebugMode) {
     print(FeatureFlags.configSummary);
   }
   ```

2. **Add more test users**
   ```dart
   // In mock_auth_service.dart
   static final List<Map<String, dynamic>> _mockUsers = [
     // Add your users here
   ];
   ```

3. **Adjust network delay**
   ```dart
   // In mock_auth_service.dart
   static const int _networkDelay = 1500; // Change this
   ```

## 🎉 Summary

**Current Status**: ✅ Mock data active

**Test Credentials**:
- `user@test.com` / `password123`
- `admin@test.com` / `admin123`
- `owner@test.com` / `owner123`

**Switch Location**: `lib/src/config/feature_flags.dart`

**Switch Method**: Change `useMockAuth` to `false`

**Documentation**: See `MOCK_DATA_GUIDE.md` for details

---

**Ready to use!** 🚀

Run `flutter run` and login with test credentials!
