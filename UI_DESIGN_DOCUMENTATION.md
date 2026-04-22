# Qirb Garage - UI Design Documentation

## Overview
This document describes the clean, minimal, high-fidelity mobile UI design for the Qirb Garage app - a nearby garage finder application.

## Design Principles

### Color Palette
- **Background**: Pure white (`#FFFFFF`) across all screens
- **Primary Accent**: Blue-black (`#1a1a2e`) for:
  - Primary buttons
  - Active states
  - Icons
  - Highlights
  - Important UI elements
- **Text Colors**:
  - Primary text: Black (`#000000`)
  - Secondary text: Black54 (`rgba(0, 0, 0, 0.54)`)
- **Subtle Separation**: Very light gray (`#F5F5F5`) only where necessary
  - Input field backgrounds
  - Social button backgrounds
  - Minimal use to avoid gray dominance

### UI Style
- **Clean & Minimal**: Modern, premium service provider aesthetic
- **Flat Design**: No drop shadows, gradients, or neumorphism
- **No Borders**: No strokes, outlines, or visible borders around:
  - Cards
  - Buttons
  - Sections
  - Containers
- **Hierarchy Through**:
  - Spacing
  - Layout
  - Color
  - Typography
- **Production-Ready**: Realistic, polished, trustworthy interface
- **Uncluttered**: Generous whitespace, not overcrowded

## Screen Designs

### 1. Splash Screen
**Purpose**: Initial app loading screen with branding

**Components**:
- Centered logo (garage icon in blue-black rounded square)
- App name "Qirb Garage" in bold black text
- Tagline "Find nearby garages instantly" in gray
- Fade-in animation (600ms)
- Auto-navigates to onboarding after 2 seconds

**Layout**:
```
┌─────────────────────┐
│                     │
│                     │
│      [LOGO]         │
│   Qirb Garage       │
│   Find nearby...    │
│                     │
│                     │
└─────────────────────┘
```

### 2. Onboarding Screens (3 pages)
**Purpose**: Introduce key app features

**Header**:
- Logo + "Qirb" text (left)
- "Skip" button (right, hidden on last page)

**Content** (per page):
1. **Find Nearby Garages**
   - Icon: Location pin in circular blue-black background
   - Title: "Find Nearby\nGarages Instantly"
   - Subtitle: Feature description

2. **Book Services**
   - Icon: Build/wrench tool
   - Title: "Book Services\nWith Ease"
   - Subtitle: Feature description

3. **Track Status**
   - Icon: Notifications bell
   - Title: "Track Your\nVehicle Status"
   - Subtitle: Feature description

**Footer**:
- Page indicator dots (blue-black active, light gray inactive)
- "Next" button (pages 1-2) / "Get Started" button (page 3)
- Full-width, 56px height, rounded 16px corners

**Layout**:
```
┌─────────────────────┐
│ [Logo] Qirb   Skip  │
│                     │
│                     │
│     [ICON 200px]    │
│                     │
│   Feature Title     │
│   Feature Subtitle  │
│                     │
│                     │
│     • • •           │
│   [Next Button]     │
└─────────────────────┘
```

### 3. Login Screen
**Purpose**: User authentication

**Components**:
- Back arrow (top left)
- Title: "Welcome Back" (32sp, bold, black)
- Subtitle: "Sign in to continue" (16sp, gray)
- Email input field (light gray background, no border)
- Password input field (with visibility toggle)
- Remember me checkbox + Forgot password link
- Sign In button (full-width, blue-black, 56px height)
- Divider with "Or continue with" text
- Social login buttons (Google, Facebook, Apple) in light gray squares
- Sign up link at bottom

**Input Fields**:
- Background: `#F5F5F5`
- No borders (borderless)
- Rounded corners: 12px
- Focus state: 2px blue-black border
- Error state: 1px red border
- Padding: 16px horizontal, 16px vertical

**Layout**:
```
┌─────────────────────┐
│ ←                   │
│                     │
│ Welcome Back        │
│ Sign in to continue │
│                     │
│ [Email Field]       │
│                     │
│ [Password Field]    │
│                     │
│ ☑ Remember  Forgot? │
│                     │
│   [Sign In]         │
│                     │
│ ─── Or continue ─── │
│                     │
│   [G] [F] [A]       │
│                     │
│ Don't have account? │
│      Sign Up        │
└─────────────────────┘
```

### 4. Sign Up Screen
**Purpose**: New user registration

**Components**:
- Back arrow (top left)
- Title: "Create Account" (32sp, bold, black)
- Subtitle: "Sign up to get started" (16sp, gray)
- Full name input field
- Email input field
- Password input field (with visibility toggle)
- Confirm password input field (with visibility toggle)
- Terms & conditions checkbox
- Create Account button (full-width, blue-black, 56px height)
- Divider with "Or continue with" text
- Social login buttons (Google, Facebook, Apple)
- Sign in link at bottom

**Layout**:
```
┌─────────────────────┐
│ ←                   │
│                     │
│ Create Account      │
│ Sign up to started  │
│                     │
│ [Full Name]         │
│ [Email Field]       │
│ [Password Field]    │
│ [Confirm Password]  │
│                     │
│ ☑ I agree to T&C    │
│                     │
│ [Create Account]    │
│                     │
│ ─── Or continue ─── │
│                     │
│   [G] [F] [A]       │
│                     │
│ Already have acc?   │
│      Sign In        │
└─────────────────────┘
```

### 5. Forgot Password Screen
**Purpose**: Password recovery

**Components**:
- Back arrow (top left)
- Title: "Forgot Password?" (32sp, bold, black)
- Description text explaining the process
- Email input field
- Send Reset Link button (full-width, blue-black, 56px height)
- Back to Login link

**Layout**:
```
┌─────────────────────┐
│ ←                   │
│                     │
│ Forgot Password?    │
│ Enter your email... │
│                     │
│                     │
│ [Email Field]       │
│                     │
│                     │
│ [Send Reset Link]   │
│                     │
│                     │
│   Back to Login     │
│                     │
└─────────────────────┘
```

## Component Specifications

### Buttons
**Primary Button**:
- Background: Blue-black (`#1a1a2e`)
- Text: White, 16sp, semi-bold
- Height: 56px
- Border radius: 16px
- No elevation/shadow
- Full-width by default
- Loading state: White circular progress indicator

**Text Button**:
- No background
- Text: Blue-black for primary actions
- Minimal padding
- No borders

**Social Buttons**:
- Size: 56x56px
- Background: Light gray (`#F5F5F5`)
- Border radius: 12px
- Icon size: 24x24px
- No borders or shadows

### Input Fields
- Background: `#F5F5F5`
- Border: None (default state)
- Border radius: 12px
- Height: Auto (based on content + padding)
- Padding: 16px horizontal, 16px vertical
- Label: Floating, 14sp, gray
- Text: 16sp, black
- Focus border: 2px blue-black
- Error border: 1px red

### Typography
**Headings**:
- H1 (Page titles): 32sp, bold, black
- H2 (Section titles): 24sp, bold, black
- H3 (Card titles): 20sp, semi-bold, black

**Body Text**:
- Large: 16sp, regular, black/gray
- Medium: 14sp, regular, gray
- Small: 12sp, regular, gray

**Button Text**:
- 16sp, semi-bold, white (on primary buttons)

### Spacing
- XXS: 2px
- XS: 4px
- SM: 8px
- MD: 16px
- LG: 24px
- XL: 32px
- XXL: 48px
- XXXL: 64px

### Icons
- Size: 24px (standard), 20px (small), 100px (onboarding)
- Color: Blue-black for active, gray for inactive
- Style: Outlined (Material Icons)

## Animations
- Fade in: 600ms
- Scale: 200ms delay
- Page transitions: 300ms ease-in-out
- Button press: Subtle scale (0.98)

## Accessibility
- Minimum touch target: 48x48px
- Color contrast ratio: 4.5:1 (WCAG AA)
- Text size: Minimum 14sp for body text
- Focus indicators: 2px border on interactive elements

## Responsive Behavior
- Uses `flutter_screenutil` for responsive sizing
- All dimensions scale proportionally
- Maintains aspect ratios across devices
- Horizontal padding: 24-32px on all screens
- Vertical spacing: Generous to avoid crowding

## Implementation Notes
- Theme: Light mode only (forced)
- Primary color: `#1a1a2e`
- No Material 3 elevation
- No card shadows
- Flat, borderless design throughout
- Clean, production-ready code
- Follows Flutter best practices
