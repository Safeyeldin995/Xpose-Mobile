# 📱 XPOSE Mobile App MVP

A complete React Native mobile application for XPOSE - Egypt's Digital Media Marketplace platform.

![XPOSE](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-blue)
![React Native](https://img.shields.io/badge/React%20Native-0.73-green)
![Expo](https://img.shields.io/badge/Expo-~50.0-black)

## ✨ Features

### Core Functionality
- ✅ **User Authentication** - Sign up, login, password reset
- ✅ **Provider Marketplace** - Browse TV channels, influencers, billboards, events, and talent
- ✅ **Search & Filter** - Find providers by category and name
- ✅ **Booking System** - Book services with date selection
- ✅ **Payment Flow** - Secure checkout process
- ✅ **Booking Management** - View and manage your bookings
- ✅ **Transaction History** - Track all payments
- ✅ **Dispute Resolution** - File and manage disputes
- ✅ **User Profile** - Manage account settings
- ✅ **Reviews & Ratings** - Rate and review providers

### Categories
- 📺 **TV Channels** - Book airtime on Egyptian TV channels
- 👥 **Influencers** - Connect with social media influencers
- 📍 **Billboards** - Book outdoor advertising spaces
- 🎭 **Events** - Book event spaces and services
- ⭐ **Talent Booking** - Book hosts, presenters, and talent

## 🎨 Fully Editable Branding

All branding elements are centralized in `/src/config/theme.js`:

### Quick Customization:
```javascript
// Change colors
colors: {
  primary: '#YOUR_COLOR',
  gradientStart: '#YOUR_GRADIENT_START',
  // ...
}

// Change logos
images: {
  logo: 'https://your-logo-url.com/logo.png',
  icon: 'https://your-icon-url.com/icon.png',
  // ...
}

// Update company info
company: {
  name: 'Your Company',
  tagline: 'Your Tagline',
  email: 'support@yourcompany.com',
  // ...
}
```

## 🚀 Quick Start

### Prerequisites
- Node.js 16+
- npm or yarn
- Expo CLI: `npm install -g expo-cli`
- Expo Go app on your phone

### Installation

```bash
# 1. Navigate to project
cd xpose-mobile

# 2. Install dependencies
npm install

# 3. Configure Supabase
# Edit src/config/supabase.js with your credentials

# 4. Start the app
npm start

# Scan the QR code with Expo Go
```

### Run on Specific Platform

```bash
# iOS (requires Mac)
npm run ios

# Android
npm run android

# Web
npm run web
```

## 📁 Project Structure

```
xpose-mobile/
├── App.js                      # Main entry point
├── app.config.js               # Expo configuration
├── package.json                # Dependencies
├── src/
│   ├── config/
│   │   ├── theme.js            # 🎨 BRANDING & THEME
│   │   └── supabase.js         # 🔧 BACKEND CONFIG
│   ├── screens/
│   │   ├── auth/               # Authentication screens
│   │   ├── main/               # Main app screens
│   │   ├── details/            # Detail/checkout screens
│   │   └── other/              # Settings, search, etc.
│   └── components/             # Reusable components
└── assets/                     # Images, fonts, etc.
```

## 🔧 Configuration

### 1. Supabase Setup

1. Create account at [supabase.com](https://supabase.com)
2. Create a new project
3. Go to Settings > API
4. Copy your Project URL and anon key
5. Update `src/config/supabase.js`:

```javascript
const SUPABASE_URL = 'YOUR_PROJECT_URL';
const SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';
```

### 2. Database Schema

Run these SQL commands in your Supabase SQL editor:

```sql
-- Create providers table
CREATE TABLE providers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  logo TEXT,
  description TEXT,
  base_price DECIMAL(10,2),
  rating DECIMAL(3,2) DEFAULT 0,
  review_count INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create bookings table
CREATE TABLE bookings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id),
  provider_id UUID NOT NULL REFERENCES providers(id),
  booking_date DATE NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW()
);

-- Add more tables as needed (see SETUP_INSTRUCTIONS.md)
```

### 3. Update Branding

Edit `/src/config/theme.js` to customize:
- Logo URLs
- Color scheme
- Company information
- Commission rates
- Payment terms

## 📱 Building for Production

### Using EAS Build (Recommended)

```bash
# Install EAS CLI
npm install -g eas-cli

# Login to Expo
eas login

# Build for iOS
eas build --platform ios

# Build for Android
eas build --platform android
```

### Classic Expo Build

```bash
# iOS (requires Mac)
expo build:ios

# Android
expo build:android
```

## 📚 Documentation

- **SETUP_INSTRUCTIONS.md** - Detailed setup guide
- **Theme Configuration** - See `/src/config/theme.js` comments
- **API Documentation** - See `/src/config/supabase.js` comments

## 🎯 Key Features in Detail

### Authentication System
- Email/password authentication
- User profile management
- Password reset functionality
- Secure session handling

### Provider Marketplace
- Category-based browsing
- Search functionality
- Provider ratings and reviews
- Detailed provider profiles

### Booking Flow
1. Browse providers
2. Select provider
3. Choose booking date
4. Review and confirm
5. Make payment
6. Track booking status

### Payment & Escrow
- Secure escrow system
- Transaction tracking
- Payment history
- Dispute management

## 🛠 Tech Stack

- **Framework**: React Native + Expo
- **Navigation**: React Navigation 6
- **Backend**: Supabase (PostgreSQL + Auth)
- **UI**: Custom components with gradient themes
- **Icons**: Ionicons
- **State**: React Hooks

## 📱 Supported Platforms

- ✅ iOS 13.0+
- ✅ Android 6.0+
- ✅ Web (responsive)

## 🎨 Design System

The app uses a comprehensive design system with:
- Consistent spacing scale
- Typography hierarchy
- Color palette with gradients
- Reusable component styles
- Shadow and elevation system

## 🔒 Security

- Secure authentication via Supabase
- Row Level Security (RLS) policies
- Encrypted data transmission
- Secure payment processing

## 📞 Support

For questions or issues:
- Email: support@xpose.eg
- Documentation: Check SETUP_INSTRUCTIONS.md
- Expo Docs: https://docs.expo.dev
- React Native Docs: https://reactnative.dev

## 📄 License

Copyright © 2025 XPOSE. All rights reserved.

---

**Built with ❤️ for XPOSE - Egypt's Digital Media Marketplace**
