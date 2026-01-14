# XPOSE Mobile App - Setup Instructions

## 📱 Overview
This is a complete React Native mobile app MVP for XPOSE - Egypt's Digital Media Marketplace. The app allows users to browse and book TV channels, influencers, billboards, events, and talent.

## 🎨 Branding & Customization

### Logo & Images
Edit `/src/config/theme.js`:
```javascript
images: {
  logo: 'YOUR_LOGO_URL',
  icon: 'YOUR_ICON_URL',
  // ... other images
}
```

### Colors
Edit the `colors` object in `/src/config/theme.js`:
```javascript
colors: {
  primary: '#0EA5E9',      // Main brand color
  gradientStart: '#3B82F6', // Gradient start
  gradientMiddle: '#06B6D4', // Gradient middle
  gradientEnd: '#14B8A6',    // Gradient end
  // ... other colors
}
```

### Company Information
Edit the `company` object in `/src/config/theme.js`:
```javascript
company: {
  name: 'XPOSE',
  tagline: 'Digital Media Marketplace',
  email: 'support@xpose.eg',
  // ... other info
}
```

## 🔧 Setup Steps

### 1. Prerequisites
- Node.js (v16 or higher)
- npm or yarn
- Expo CLI: `npm install -g expo-cli`
- Expo Go app on your phone (for testing)

### 2. Install Dependencies
```bash
cd xpose-mobile
npm install
```

### 3. Configure Supabase
Edit `/src/config/supabase.js`:
```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_PROJECT_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

Get these values from your Supabase project dashboard.

### 4. Run the App

**For iOS:**
```bash
npm run ios
```

**For Android:**
```bash
npm run android
```

**For Web:**
```bash
npm run web
```

**Using Expo Go (Recommended for testing):**
```bash
npm start
```
Then scan the QR code with Expo Go app.

## 📁 Project Structure

```
xpose-mobile/
├── App.js                    # Main app entry point
├── app.config.js             # Expo configuration
├── package.json              # Dependencies
├── src/
│   ├── config/
│   │   ├── theme.js          # ✏️ EDIT THIS for branding
│   │   └── supabase.js       # ✏️ EDIT THIS for backend
│   ├── screens/
│   │   ├── auth/
│   │   │   ├── WelcomeScreen.js
│   │   │   ├── LoginScreen.js
│   │   │   └── SignUpScreen.js
│   │   ├── main/
│   │   │   ├── HomeScreen.js
│   │   │   ├── ExploreScreen.js
│   │   │   ├── BookingsScreen.js
│   │   │   └── ProfileScreen.js
│   │   ├── details/
│   │   │   ├── ProviderDetailScreen.js
│   │   │   ├── BookingDetailScreen.js
│   │   │   ├── BookingCheckoutScreen.js
│   │   │   └── ReviewScreen.js
│   │   └── other/
│   │       ├── SearchScreen.js
│   │       ├── TransactionsScreen.js
│   │       ├── DisputesScreen.js
│   │       └── SettingsScreen.js
│   └── components/          # Reusable components
└── assets/                  # Images, fonts, etc.
```

## 🎯 Features

### Implemented:
- ✅ User Authentication (Sign Up, Login, Logout)
- ✅ Browse Providers by Category
- ✅ Provider Details & Reviews
- ✅ Booking System
- ✅ Escrow Payment Flow
- ✅ Transaction History
- ✅ Dispute Management
- ✅ User Profile
- ✅ Search Functionality

### Categories:
- 📺 TV Channels
- 👥 Influencers
- 📍 Billboards
- 🎭 Events
- ⭐ Talent Booking

## 🗄️ Database Schema

Your Supabase database should have these tables:

```sql
-- providers table
CREATE TABLE providers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  logo TEXT,
  description TEXT,
  base_price DECIMAL,
  rating DECIMAL DEFAULT 0,
  review_count INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

-- bookings table
CREATE TABLE bookings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id),
  provider_id UUID NOT NULL REFERENCES providers(id),
  booking_date DATE NOT NULL,
  amount DECIMAL NOT NULL,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW()
);

-- transactions table
CREATE TABLE transactions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id),
  booking_id UUID REFERENCES bookings(id),
  amount DECIMAL NOT NULL,
  type TEXT NOT NULL,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW()
);

-- reviews table
CREATE TABLE reviews (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id),
  provider_id UUID NOT NULL REFERENCES providers(id),
  booking_id UUID REFERENCES bookings(id),
  rating INTEGER NOT NULL,
  comment TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- disputes table
CREATE TABLE disputes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id),
  booking_id UUID NOT NULL REFERENCES bookings(id),
  reason TEXT NOT NULL,
  status TEXT DEFAULT 'open',
  created_at TIMESTAMP DEFAULT NOW()
);
```

## 📱 Building for Production

### iOS (requires Mac):
```bash
expo build:ios
```

### Android:
```bash
expo build:android
```

### Using EAS Build (recommended):
```bash
npm install -g eas-cli
eas build --platform ios
eas build --platform android
```

## 🎨 Customization Tips

1. **Replace all placeholder images** in `/src/config/theme.js`
2. **Update app icon**: Place your icon in `/assets/icon.png` (1024x1024)
3. **Update splash screen**: Place your splash in `/assets/splash.png`
4. **Modify colors** to match your brand in `theme.js`
5. **Update company info** in `theme.js`

## 🐛 Troubleshooting

**"Module not found" errors:**
```bash
rm -rf node_modules
npm install
```

**"Expo Go" errors:**
- Make sure Expo Go app is up to date
- Clear Expo cache: `expo start -c`

**Supabase connection issues:**
- Verify your SUPABASE_URL and SUPABASE_ANON_KEY
- Check your Supabase project is active

## 📧 Support

For issues or questions:
- Email: support@xpose.eg
- Check Expo documentation: https://docs.expo.dev
- Check React Native docs: https://reactnative.dev

## 🚀 Next Steps

1. Add your actual Supabase credentials
2. Replace placeholder images with your branding
3. Test on physical devices
4. Submit to App Store / Play Store

---

**Built with ❤️ for XPOSE**
