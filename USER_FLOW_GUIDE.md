# Qirb Garage - User Flow Guide

## 🚀 Complete User Journey

### First Time User Experience

```
┌─────────────┐
│   SPLASH    │  (2 seconds)
│   SCREEN    │  - Shows logo and app name
└──────┬──────┘  - Checks if first time
       │
       ▼
┌─────────────┐
│ ONBOARDING  │  (Only first time)
│  3 SCREENS  │  - Find Nearby Garages
└──────┬──────┘  - View Repair Guides
       │          - Spare Parts
       │          [Skip or Get Started]
       ▼
┌─────────────┐
│ NAVIGATION  │  Main Home Screen
│    PAGE     │  - 3 service cards
└─────────────┘  - AI chat button
```

### Returning User Experience

```
┌─────────────┐
│   SPLASH    │  (2 seconds)
│   SCREEN    │  - Detects returning user
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ NAVIGATION  │  Directly to home
│    PAGE     │  - No onboarding
└─────────────┘
```

## 📱 Main Navigation Page

### Header (App Bar)
```
┌────────────────────────────────────────────┐
│ [🏠 Logo] Qirb Garage                      │
│                                            │
│  NOT LOGGED IN:                            │
│  [Login] [Get Started]                     │
│                                            │
│  LOGGED IN:                                │
│  [❤️ Favorites]                            │
└────────────────────────────────────────────┘
```

### Content
```
┌────────────────────────────────────────────┐
│                                            │
│  What can we help                          │
│  you with today?                           │
│                                            │
│  Choose a service to get started           │
│                                            │
│  ┌──────────────────────────────────────┐ │
│  │ 📍  Find Nearby Garage               │ │
│  │     Discover trusted garages near you│ │
│  └──────────────────────────────────────┘ │
│                                            │
│  ┌──────────────────────────────────────┐ │
│  │ 📖  View Repair Guides               │ │
│  │     Learn how to fix common issues   │ │
│  └──────────────────────────────────────┘ │
│                                            │
│  ┌──────────────────────────────────────┐ │
│  │ 🔧  Spare Parts                      │ │
│  │     Find quality parts for vehicle   │ │
│  └──────────────────────────────────────┘ │
│                                            │
│                              [💬 AI Chat] │
└────────────────────────────────────────────┘
```

## 🏪 Service 1: Find Nearby Garage

### Garage List Screen
```
┌────────────────────────────────────────────┐
│ [←] Nearby Garages          [Login/❤️]     │
├────────────────────────────────────────────┤
│ [🔍 Search by name or city...]            │
│                                            │
│ [ALL SPECIALTIES ▼] [NEAREST FIRST ▼] [📍]│
├────────────────────────────────────────────┤
│ 7 SPECIALISTS FOUND - SHOWING NEAREST FIRST│
├────────────────────────────────────────────┤
│                                            │
│ ┌──────────────────────────────────────┐  │
│ │ [Image]              57.44 KM    [❤️]│  │
│ │                                      │  │
│ │ POUL                                 │  │
│ │ 📍 Local, Summit, Hawassa...         │  │
│ │                                      │  │
│ │ [GENERAL MAINTENANCE]                │  │
│ │ [TRANSMISSION EXPERT]                │  │
│ │                                      │  │
│ │ [DETAILS]        [REQUEST NOW]       │  │
│ └──────────────────────────────────────┘  │
│                                            │
│ [More garage cards...]                     │
└────────────────────────────────────────────┘
```

### Garage Detail Screen
```
┌────────────────────────────────────────────┐
│ [←]                              [Share]   │
├────────────────────────────────────────────┤
│              [A ✓]                         │
│         Abel Buro Garage                   │
│         Verified specialist                │
│              ⭐ 0                          │
│                                            │
│ 📍 Local, Summit, Addis Ababa, Ethiopia   │
│ 📞 0954197597                              │
│ 🕐 General: 08:00 - 18:00 (Mon - Sat)     │
├────────────────────────────────────────────┤
│ ⭐ INTEL SPECS                             │
│                                            │
│ [TOOLS: High]    [EXP: 12+ Yrs]           │
│ [TECH: Verified] [PARTS: Official]        │
├────────────────────────────────────────────┤
│ 🛡️ Enterprise guarantee                   │
│    Insurance-backed repair protocols       │
├────────────────────────────────────────────┤
│ [ABOUT] [SERVICES] [REVIEWS]              │
│                                            │
│ [Tab content here]                         │
│                                            │
├────────────────────────────────────────────┤
│ [Protocol inquiry] [Request Mechanic 🔧]  │
└────────────────────────────────────────────┘
```

## 🔧 Service 2: Spare Parts

### Spare Parts List
```
┌────────────────────────────────────────────┐
│ [←] Spare Parts                [Login/❤️]  │
├────────────────────────────────────────────┤
│ [All] [Engine] [Transmission] [Brakes]... │
├────────────────────────────────────────────┤
│                                            │
│ ┌─────────────┐  ┌─────────────┐          │
│ │[For Sale]   │  │[For Sale]   │          │
│ │[New]    [❤️]│  │[New]    [❤️]│          │
│ │             │  │             │          │
│ │ Brakes      │  │ Engine      │          │
│ │ Brake Pads  │  │ Piston      │          │
│ │ $18,000     │  │ $15,000     │          │
│ │             │  │             │          │
│ │ 👤 Abrish   │  │ 👤 Alem     │          │
│ │ Posted 1d   │  │ Posted 1d   │          │
│ │             │  │             │          │
│ │[DETAILS]    │  │[DETAILS]    │          │
│ │[REQUEST]    │  │[REQUEST]    │          │
│ └─────────────┘  └─────────────┘          │
│                                            │
│ [More parts in grid...]                    │
└────────────────────────────────────────────┘
```

### Spare Part Detail (Dark Theme)
```
┌────────────────────────────────────────────┐
│ [←] 📦 PART DETAILS      [REF: SP-0007]   │
├────────────────────────────────────────────┤
│                                            │
│         [Main Image]                       │
│                                            │
│              1/3                           │
│         [🖼️] [🖼️] [🖼️]                    │
├────────────────────────────────────────────┤
│ [SPARE PART]                               │
│                                            │
│ BRAKE PADS                                 │
│                                            │
│ $18000                                     │
│                                            │
│ CONDITION        MODEL                     │
│ NEW              TOYOTA RAV4               │
│                                            │
│ ℹ️ DESCRIPTION                             │
│ brake pads for toyota                      │
│                                            │
│ 👤 SELLER INFO                             │
│ 🎫 FULL NAME: ABRISH GEREMEW              │
│ 👥 SELLER TYPE: INDIVIDUAL SELLER         │
│ 📞 PHONE NUMBER: 0987764554               │
│                                            │
├────────────────────────────────────────────┤
│ [💬] [DIRECT REQUEST →]           [❤️]    │
└────────────────────────────────────────────┘
```

## 📖 Service 3: Repair Guides

### Repair Guides List
```
┌────────────────────────────────────────────┐
│ [←] Repair Guides              [Login/❤️]  │
├────────────────────────────────────────────┤
│ [🔍 Search repair guides...]              │
├────────────────────────────────────────────┤
│                                            │
│ ┌──────────────────────────────────────┐  │
│ │ [Image] │ [Engine]                   │  │
│ │         │ How to Change Engine Oil   │  │
│ │         │ 🟢 Easy  ⏱️ 30 min         │  │
│ │         │ 👁️ 1.2K views              │  │
│ └──────────────────────────────────────┘  │
│                                            │
│ ┌──────────────────────────────────────┐  │
│ │ [Image] │ [Brakes]                   │  │
│ │         │ Brake Pad Replacement      │  │
│ │         │ 🟠 Medium  ⏱️ 45 min       │  │
│ │         │ 👁️ 890 views               │  │
│ └──────────────────────────────────────┘  │
│                                            │
│ [More guides...]                           │
└────────────────────────────────────────────┘
```

## 🔐 Authentication Flow

### When User Clicks "Request" or "Message" Without Login
```
┌────────────────────────────────────────────┐
│                                            │
│  User clicks [REQUEST NOW] or [MESSAGE]    │
│              ↓                             │
│  Check: Is user logged in?                 │
│              ↓                             │
│         ┌────┴────┐                        │
│         │         │                        │
│       YES        NO                        │
│         │         │                        │
│         ↓         ↓                        │
│   Show Request  Redirect to                │
│   Form/Chat     Login Screen               │
│                                            │
└────────────────────────────────────────────┘
```

## 🤖 AI Chat Feature

### AI Chat Bottom Sheet
```
┌────────────────────────────────────────────┐
│ [🤖] AI Assistant              [✕]         │
│      Ask me anything                       │
├────────────────────────────────────────────┤
│                                            │
│ ┌────────────────────────────────────┐    │
│ │ Hello! How can I help you today?  │    │
│ └────────────────────────────────────┘    │
│                                            │
│                                            │
│                                            │
│                                            │
├────────────────────────────────────────────┤
│ [Type your message...]            [Send]   │
└────────────────────────────────────────────┘
```

## 🎨 Design System Summary

### Colors
- **Background**: White (#FFFFFF)
- **Primary**: Green (#10b981)
- **Text**: Black (#000000)
- **Secondary Text**: Gray (#6B7280)
- **Borders**: Very light gray (minimal)

### Typography
- **Headlines**: Bold, Black
- **Body**: Regular, Black/Gray
- **Buttons**: Bold, White on Green

### Components
- **Flat design** (no shadows)
- **Rounded corners** (12-16px)
- **Minimal borders**
- **Clean spacing**
- **Icon-first approach**

## ✅ Key Features

1. **First-time onboarding** (only once)
2. **Three core services** clearly presented
3. **Authentication checks** before sensitive actions
4. **Favorites system** (for logged-in users)
5. **AI chat assistant**
6. **Responsive design**
7. **Clean navigation**
8. **Mock data ready** for backend integration

## 🔄 State Management

- **Session**: Riverpod (authentication state)
- **Navigation**: GoRouter (declarative routing)
- **Local Storage**: SharedPreferences (first-time check)

## 📦 Ready for Backend

All screens use mock data that can be easily replaced with:
- API calls
- Real authentication
- Database queries
- Real-time updates

The architecture is clean and ready for integration!
