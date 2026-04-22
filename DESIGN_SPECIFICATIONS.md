# Design Specifications - Qirb Garage

## 🎨 Design System

### Color Palette

#### Primary Colors
```
White Background:    #FFFFFF (rgb(255, 255, 255))
Blue-Black Primary:  #1a1a2e (rgb(26, 26, 46))
Pure Black Text:     #000000 (rgb(0, 0, 0))
```

#### Secondary Colors
```
Black 87%:           rgba(0, 0, 0, 0.87) - Primary text
Black 54%:           rgba(0, 0, 0, 0.54) - Secondary text
Black 12%:           rgba(0, 0, 0, 0.12) - Inactive indicators
Light Gray:          #F5F5F5 (rgb(245, 245, 245)) - Input backgrounds
```

#### Semantic Colors
```
Error:               #FF0000 (rgb(255, 0, 0))
Success:             #4CAF50 (rgb(76, 175, 80))
Warning:             #FF9800 (rgb(255, 152, 0))
```

### Typography

#### Font Family
- Primary: System default (San Francisco on iOS, Roboto on Android)
- Weight: Regular (400), Medium (500), Semi-Bold (600), Bold (700)

#### Text Styles
```
Display Large:       32sp, Bold, Black
Display Medium:      28sp, Bold, Black
Headline Large:      24sp, Bold, Black
Headline Medium:     20sp, Semi-Bold, Black
Title Large:         18sp, Semi-Bold, Black
Title Medium:        16sp, Semi-Bold, Black/White
Body Large:          16sp, Regular, Black/Gray
Body Medium:         14sp, Regular, Gray
Body Small:          12sp, Regular, Gray
Label Large:         14sp, Medium, Primary/Gray
Label Medium:        12sp, Medium, Gray
Label Small:         10sp, Medium, Gray
```

#### Line Heights
```
Tight:               1.2 (for headlines)
Normal:              1.5 (for body text)
Relaxed:             1.6 (for descriptions)
```

### Spacing System (8pt Grid)

```
XXS:    2px   (0.25 × base)
XS:     4px   (0.5 × base)
SM:     8px   (1 × base)
MS:     12px  (1.5 × base)
MD:     16px  (2 × base)
ML:     20px  (2.5 × base)
LG:     24px  (3 × base)
XL:     32px  (4 × base)
XXL:    48px  (6 × base)
XXXL:   64px  (8 × base)
```

#### Usage Guidelines
- **XXS (2px)**: Icon-to-label spacing
- **XS (4px)**: Tight element spacing
- **SM (8px)**: Compact component padding
- **MS (12px)**: Form field gaps
- **MD (16px)**: Standard padding, list gaps
- **ML (20px)**: Comfortable section spacing
- **LG (24px)**: Page horizontal padding
- **XL (32px)**: Major section breaks
- **XXL (48px)**: Top-of-page spacing
- **XXXL (64px)**: Hero section padding

### Border Radius

```
Small:               4px   - Checkboxes, small chips
Medium:              8px   - Cards, small buttons
Large:               12px  - Input fields, social buttons
XLarge:              16px  - Primary buttons
XXLarge:             24px  - Logo container
Circular:            50%   - Avatars, icon backgrounds
```

### Elevation & Shadows

**Design Principle**: NO SHADOWS
- Flat design throughout
- Use spacing and color for hierarchy
- No drop shadows on any elements
- No elevation on cards or buttons

### Icons

#### Sizes
```
Small:               16px
Medium:              20px
Standard:            24px
Large:               32px
XLarge:              48px
Hero:                100px (onboarding)
```

#### Style
- Material Icons Outlined
- Stroke width: 2px
- Color: Blue-black for active, gray for inactive

### Components

#### Buttons

**Primary Button**
```
Height:              56px
Border Radius:       16px
Background:          #1a1a2e
Text Color:          #FFFFFF
Text Size:           16sp
Text Weight:         Semi-Bold (600)
Padding:             16px horizontal
Elevation:           0 (flat)
Full Width:          Yes (default)
```

**Text Button**
```
Height:              Auto
Background:          Transparent
Text Color:          #1a1a2e (primary action)
Text Size:           14-16sp
Text Weight:         Medium-Semi-Bold
Padding:             8-16px
```

**Social Button**
```
Size:                56×56px
Border Radius:       12px
Background:          #F5F5F5
Icon Size:           24×24px
Elevation:           0 (flat)
Border:              None
```

#### Input Fields

**Text Input**
```
Height:              Auto (content + padding)
Border Radius:       12px
Background:          #F5F5F5
Border:              None (default)
Focus Border:        2px #1a1a2e
Error Border:        1px #FF0000
Padding:             16px horizontal, 16px vertical
Label Size:          14sp
Label Color:         rgba(0, 0, 0, 0.54)
Text Size:           16sp
Text Color:          #000000
```

**States**
- Default: Light gray background, no border
- Focus: 2px blue-black border
- Error: 1px red border, error message below
- Disabled: 50% opacity

#### Checkboxes & Radio Buttons

```
Size:                20×20px
Border Radius:       4px (checkbox), 50% (radio)
Border:              2px rgba(0, 0, 0, 0.54)
Active Color:        #1a1a2e
Checkmark:           White
```

#### Page Indicators

```
Inactive:
  Width:             8px
  Height:            8px
  Border Radius:     4px
  Color:             rgba(0, 0, 0, 0.12)

Active:
  Width:             32px
  Height:            8px
  Border Radius:     4px
  Color:             #1a1a2e
```

### Layout

#### Screen Padding
```
Horizontal:          24-32px (LG-XL)
Vertical:            16-24px (MD-LG)
Top Safe Area:       48-64px (XXL-XXXL)
Bottom Safe Area:    24-32px (LG-XL)
```

#### Content Width
```
Maximum:             600px (for tablets)
Minimum:             320px (small phones)
Optimal:             375-428px (modern phones)
```

#### Grid System
- 8pt base grid
- All spacing multiples of 8
- Consistent alignment
- Generous whitespace

### Animations

#### Durations
```
Fast:                150ms  - Micro-interactions
Normal:              300ms  - Page transitions
Slow:                600ms  - Fade-ins, reveals
```

#### Easing
```
Standard:            ease-in-out
Enter:               ease-out
Exit:                ease-in
```

#### Types
- Fade in/out
- Scale (0.98-1.0 for press)
- Slide (page transitions)
- No complex animations

### Accessibility

#### Touch Targets
```
Minimum:             48×48px
Recommended:         56×56px
Spacing:             8px minimum between targets
```

#### Color Contrast
```
Normal Text:         4.5:1 (WCAG AA)
Large Text:          3:1 (WCAG AA)
UI Components:       3:1 (WCAG AA)
```

#### Text Sizes
```
Minimum Body:        14sp
Minimum Label:       12sp
Recommended Body:    16sp
```

### Responsive Breakpoints

```
Small Phone:         320-375px
Medium Phone:        375-414px
Large Phone:         414-428px
Tablet:              768px+
```

#### Scaling Strategy
- Use flutter_screenutil for proportional scaling
- Maintain aspect ratios
- Adjust padding for larger screens
- Keep text readable (don't scale too much)

## 📐 Screen Specifications

### Splash Screen
```
Background:          #FFFFFF
Logo Size:           100×100px
Logo Radius:         24px
Logo Color:          #1a1a2e
Icon Size:           60px
Icon Color:          #FFFFFF
Title Size:          28sp
Title Weight:        Bold
Subtitle Size:       14sp
Subtitle Color:      rgba(0, 0, 0, 0.54)
Animation:           Fade in 600ms, Scale 200ms delay
Duration:            2 seconds
```

### Onboarding
```
Background:          #FFFFFF
Header Height:       56px
Logo Size:           36×36px
Logo Radius:         10px
Skip Button:         14sp, Medium, Gray
Icon Container:      200×200px
Icon Size:           100px
Icon Color:          #1a1a2e
Icon Background:     rgba(26, 26, 46, 0.08)
Title Size:          32sp
Title Weight:        Bold
Subtitle Size:       16sp
Subtitle Color:      rgba(0, 0, 0, 0.54)
Button Height:       56px
Indicator Spacing:   4px
```

### Login Screen
```
Background:          #FFFFFF
Back Button:         24px icon
Title Size:          32sp
Title Weight:        Bold
Subtitle Size:       16sp
Input Height:        Auto
Input Spacing:       24px
Checkbox Size:       20×20px
Button Height:       56px
Social Button:       56×56px
Divider Color:       rgba(0, 0, 0, 0.12)
Link Color:          #1a1a2e
```

### Sign Up Screen
```
Background:          #FFFFFF
Back Button:         24px icon
Title Size:          32sp
Title Weight:        Bold
Subtitle Size:       16sp
Input Height:        Auto
Input Spacing:       24px
Checkbox Size:       20×20px
Button Height:       56px
Social Button:       56×56px
Terms Text:          12sp
```

### Forgot Password
```
Background:          #FFFFFF
Back Button:         24px icon
Title Size:          32sp
Title Weight:        Bold
Description Size:    16sp
Description Color:   rgba(0, 0, 0, 0.54)
Input Height:        Auto
Button Height:       56px
Link Size:           16sp
Link Weight:         Semi-Bold
```

## 🎯 Design Principles

### 1. Minimalism
- Remove unnecessary elements
- Focus on essential content
- Use whitespace effectively
- Avoid clutter

### 2. Flat Design
- No shadows or depth
- No gradients
- No 3D effects
- Clean, 2D interface

### 3. Hierarchy
- Size for importance
- Weight for emphasis
- Color for attention
- Spacing for grouping

### 4. Consistency
- Reuse components
- Maintain spacing
- Follow patterns
- Predictable behavior

### 5. Clarity
- Clear labels
- Obvious actions
- Readable text
- Intuitive navigation

### 6. Accessibility
- High contrast
- Large touch targets
- Clear focus states
- Screen reader support

## ✅ Quality Checklist

### Visual
- [ ] White background on all screens
- [ ] Blue-black used only for accents
- [ ] No shadows anywhere
- [ ] No borders (except focus/error)
- [ ] Consistent spacing
- [ ] Proper text hierarchy
- [ ] Icons properly sized
- [ ] Buttons properly styled

### Functional
- [ ] All navigation works
- [ ] Forms validate correctly
- [ ] Loading states display
- [ ] Error messages show
- [ ] Animations smooth
- [ ] Touch targets adequate
- [ ] Responsive on all sizes

### Accessibility
- [ ] Color contrast meets WCAG AA
- [ ] Text readable at all sizes
- [ ] Touch targets 48px minimum
- [ ] Focus indicators visible
- [ ] Labels clear and descriptive

## 📱 Platform Considerations

### iOS
- Use San Francisco font
- Follow iOS Human Interface Guidelines
- Respect safe areas
- Use iOS-style navigation

### Android
- Use Roboto font
- Follow Material Design principles
- Use Android-style navigation
- Respect system bars

### Both
- Maintain consistent branding
- Adapt to platform conventions
- Test on real devices
- Consider platform-specific features

---

**Last Updated**: April 21, 2026
**Version**: 1.0.0
**Status**: Production Ready ✅
