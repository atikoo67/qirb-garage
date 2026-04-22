# Qirb Garage - Mobile App

A complete, production-ready garage service mobile application built with Flutter.

## 🎯 Features

### Core Services
- **Find Nearby Garages** - Discover trusted garages with search, filters, and GPS
- **View Repair Guides** - Learn how to fix common vehicle issues
- **Spare Parts** - Find quality parts from verified sellers

### User Experience
- ✅ Smooth onboarding (first-time only)
- ✅ Text-based splash screen with animated loading
- ✅ Authentication system with session management
- ✅ AI chat assistant
- ✅ Favorites system
- ✅ Responsive design optimized for mobile

## 🎨 Design System

- **White backgrounds** throughout
- **Green (#10b981)** as the only accent color
- **Black text** for primary content
- **Flat design** - no shadows or borders
- **Clean, minimal** aesthetic
- **Mobile-optimized** sizes and spacing

## 📱 Screenshots

### Splash Screen
- Text-based logo: "Qirb" (black) + "Garage" (green)
- Tagline: "Your garage. Anywhere."
- 3 animated green dots

### Home
- 3 service cards with icons
- AI chat floating button
- Login/Get Started or Favorites (based on auth state)

### Services
- Garage listings with images, distance, specialties
- Spare parts grid with categories
- Repair guides with difficulty indicators

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.5.0 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile)
- Chrome (for web)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd qirb-garage
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # Android
   flutter run -d emulator-5554
   
   # iOS (Mac only)
   flutter run -d ios
   
   # Web
   flutter run -d chrome
   ```

## 📂 Project Structure

```
lib/
├── src/
│   ├── features/
│   │   ├── splash/          # Splash screen with animation
│   │   ├── onboarding/      # First-time user onboarding
│   │   ├── home/            # Navigation page
│   │   ├── garage/          # Garage list and detail
│   │   ├── spare_parts/     # Spare parts list and detail
│   │   ├── repair_guides/   # Repair guides
│   │   ├── favorites/       # Favorites screen
│   │   └── auth/            # Authentication screens
│   ├── theme/               # App theme and spacing
│   ├── routing/             # Navigation configuration
│   └── config/              # App configuration
└── main.dart
```

## 🎯 Key Screens

### 1. Splash Screen
- Duration: 3 seconds
- Checks first-time user
- Animated loading dots

### 2. Onboarding (First Time Only)
- 3 screens explaining services
- Skip or complete to home
- Saves preference locally

### 3. Navigation Page (Home)
- 3 service cards
- AI chat button
- Auth-aware app bar

### 4. Garage Services
- **List**: Search, filters, GPS, cards
- **Detail**: Profile, specs, tabs, actions

### 5. Spare Parts
- **List**: Categories, grid layout
- **Detail**: Dark theme, gallery, seller info

### 6. Repair Guides
- List with difficulty indicators
- Search functionality
- Category badges

## 🔧 Configuration

### Theme
Edit `lib/src/app.dart` to change primary color:
```dart
theme: buildLightTheme(primaryColorHex: '#10b981'),
```

### Spacing
Edit `lib/src/theme/app_spacing.dart` to adjust spacing values.

### Routes
Edit `lib/src/routing/app_router.dart` to add/modify routes.

## 📦 Dependencies

### Core
- `flutter_riverpod` - State management
- `go_router` - Navigation
- `flutter_hooks` - React-like hooks

### UI
- `flutter_screenutil` - Responsive sizing
- `flutter_animate` - Animations
- `skeletonizer` - Loading states

### Storage
- `shared_preferences` - Local storage
- `flutter_secure_storage` - Secure storage

### Utilities
- `dio` - HTTP client
- `cached_network_image` - Image caching
- `geolocator` - Location services

## 🎨 Assets

### Images
```
assets/images/
├── garage/          # Garage images (2 files)
├── sparepart/       # Spare part images (2 files)
└── manual/          # Repair guide images (2 files)
```

All images are loaded from local assets for better performance.

## 📝 Documentation

- **IMPLEMENTATION_SUMMARY.md** - Complete technical overview
- **USER_FLOW_GUIDE.md** - Visual flow diagrams
- **FEATURE_CHECKLIST.md** - Detailed feature list
- **TESTING_GUIDE.md** - Testing instructions
- **SPLASH_SCREEN_UPDATE.md** - Splash screen design
- **SIZE_OPTIMIZATION_COMPLETE.md** - Size optimization details
- **ASSETS_INTEGRATION_COMPLETE.md** - Asset integration
- **QUICK_START.md** - Quick reference guide

## 🧪 Testing

### Manual Testing
See `TESTING_GUIDE.md` for comprehensive testing checklist.

### Run Tests
```bash
flutter test
```

## 🔄 State Management

- **Riverpod** for global state
- **Hooks** for local state
- **Session management** for authentication

## 🌐 Backend Integration

The app uses mock data currently. To integrate with a backend:

1. Update API endpoints in `lib/src/config/app_config.dart`
2. Implement repository methods in respective feature folders
3. Replace mock data with API calls

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ⚠️ Windows (build issue with flutter_secure_storage)

## 🐛 Known Issues

### Windows Build
- **Issue**: Build fails due to flutter_secure_storage dependency
- **Solution**: Use Android, iOS, or Web platforms

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 📄 License

[Your License Here]

## 👥 Contributors

[Your Team Here]

## 📞 Support

For issues and questions, please open an issue on GitHub.

## 🎉 Status

**Production-Ready UI** ✅

All screens are:
- ✅ Designed and implemented
- ✅ Size-optimized for mobile
- ✅ Following design system
- ✅ Using local assets
- ✅ Ready for backend integration

---

**Built with ❤️ using Flutter**
