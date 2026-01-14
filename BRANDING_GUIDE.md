# 🎨 XPOSE Mobile App - Branding Customization Guide

## Overview

Your XPOSE mobile app is **100% customizable**. All branding elements are centralized in a single configuration file, making it easy to rebrand the entire app by editing just one file.

---

## 📍 Location of Branding File

**File:** `src/config/theme.js`

This is the ONLY file you need to edit for complete branding customization.

---

## 🎨 What You Can Customize

### 1. Colors (Brand Palette)
### 2. Logos & Images
### 3. Company Information
### 4. Typography
### 5. Spacing & Layout
### 6. Business Rules (Commission, Payment Terms)

---

## 1. 🌈 Customizing Colors

### Location in theme.js:
```javascript
colors: {
  // Primary gradient (Blue to Cyan to Turquoise)
  primary: '#0EA5E9',      // Main brand color
  primaryDark: '#0284C7',  // Darker shade
  primaryLight: '#38BDF8', // Lighter shade
  
  // Gradient colors for XPOSE brand
  gradientStart: '#3B82F6',  // Blue
  gradientMiddle: '#06B6D4', // Cyan
  gradientEnd: '#14B8A6',    // Turquoise
  
  // ... more colors
}
```

### How to Customize:

**Option A: Use Your Exact Brand Colors**
```javascript
colors: {
  primary: '#FF6B35',           // Your brand orange
  gradientStart: '#FF6B35',     // Orange
  gradientMiddle: '#F7931E',    // Lighter orange
  gradientEnd: '#FDC830',       // Yellow-orange
  
  success: '#10B981',           // Keep these or change
  warning: '#F59E0B',
  error: '#EF4444',
  // ...
}
```

**Option B: Generate a Palette**
1. Go to coolors.co or colorhunt.co
2. Generate a palette you like
3. Copy the hex codes
4. Replace in theme.js

### Where These Colors Appear:
- **primary**: Buttons, links, highlights
- **gradientStart/Middle/End**: Welcome screen, hero banners, accents
- **success**: Success messages, completed bookings
- **warning**: Pending status, alerts
- **error**: Error messages, cancelled bookings

---

## 2. 🖼️ Customizing Logos & Images

### Location in theme.js:
```javascript
images: {
  // Main app logo (transparent PNG recommended)
  logo: 'https://via.placeholder.com/200x80/0EA5E9/FFFFFF?text=XPOSE',
  
  // Square icon for app icon
  icon: 'https://via.placeholder.com/512x512/0EA5E9/FFFFFF?text=X',
  
  // Splash screen logo
  splashLogo: 'https://via.placeholder.com/300x120/0EA5E9/FFFFFF?text=XPOSE',
  
  // Default avatars/placeholders
  defaultAvatar: 'https://via.placeholder.com/150/0EA5E9/FFFFFF?text=User',
  defaultChannelLogo: 'https://via.placeholder.com/150/0EA5E9/FFFFFF?text=Channel',
  // ...
}
```

### How to Customize:

**Step 1: Prepare Your Images**
- **Logo**: Transparent PNG, ~600x240px (wider is better)
- **Icon**: Square PNG, 1024x1024px minimum
- **Splash Logo**: Transparent PNG, ~900x360px

**Step 2: Upload to Image Hosting**
- Use: Imgur, Cloudinary, AWS S3, or your own server
- Get the direct image URLs

**Step 3: Update theme.js**
```javascript
images: {
  logo: 'https://yourdomain.com/images/logo.png',
  icon: 'https://yourdomain.com/images/icon.png',
  splashLogo: 'https://yourdomain.com/images/splash-logo.png',
  defaultAvatar: 'https://yourdomain.com/images/avatar-default.png',
  // ...
}
```

### Where These Images Appear:
- **logo**: Header on all screens
- **icon**: App icon on phone home screen
- **splashLogo**: First screen when app opens
- **defaultAvatar**: User profile placeholder
- **defaultChannelLogo**: Provider placeholder

---

## 3. 🏢 Customizing Company Information

### Location in theme.js:
```javascript
company: {
  name: 'XPOSE',
  tagline: 'Digital Media Marketplace',
  description: 'Connect with TV channels, influencers, billboards, events, and talent booking services',
  email: 'support@xpose.eg',
  phone: '+20 xxx xxx xxxx',
  website: 'https://xpose.eg',
  
  // Commission rates
  commission: {
    default: 0.10,      // 10%
    tvChannels: 0.10,   // 10% for TV channels
    influencers: 0.15,  // 15% for influencers
    billboards: 0.10,   // 10% for billboards
    events: 0.12,       // 12% for events
    talent: 0.15,       // 15% for talent booking
  },
  
  // Payment terms
  payment: {
    escrowHoldDays: 7,        // Days to hold payment in escrow
    disputeWindowDays: 14,    // Days to open a dispute
  },
}
```

### How to Customize:

**Replace with Your Information:**
```javascript
company: {
  name: 'YourCompany',
  tagline: 'Your Awesome Tagline Here',
  description: 'What your marketplace does - explain in one sentence',
  email: 'hello@yourcompany.com',
  phone: '+1 555 123 4567',
  website: 'https://yourcompany.com',
  
  commission: {
    default: 0.08,       // 8% commission
    tvChannels: 0.08,
    influencers: 0.12,
    // ... adjust as needed
  },
  
  payment: {
    escrowHoldDays: 5,      // Hold for 5 days
    disputeWindowDays: 10,   // 10 day dispute window
  },
}
```

### Where This Information Appears:
- **name & tagline**: Welcome screen, about section
- **description**: App store listing, welcome screen
- **email & phone**: Support section, contact info
- **commission**: Calculated in checkout, displayed in pricing
- **payment terms**: Shown during checkout, in help section

---

## 4. ✍️ Customizing Typography (Optional)

### Location in theme.js:
```javascript
fonts: {
  regular: 'System',
  medium: 'System',
  semiBold: 'System',
  bold: 'System',
},

fontSizes: {
  xs: 12,
  sm: 14,
  base: 16,
  lg: 18,
  xl: 20,
  '2xl': 24,
  '3xl': 30,
  '4xl': 36,
}
```

### How to Customize:

**To use custom fonts:**
1. Add font files to `assets/fonts/` folder
2. Load fonts in App.js using expo-font
3. Update theme.js:

```javascript
fonts: {
  regular: 'YourFont-Regular',
  medium: 'YourFont-Medium',
  semiBold: 'YourFont-SemiBold',
  bold: 'YourFont-Bold',
}
```

**To adjust sizes:**
```javascript
fontSizes: {
  xs: 11,    // Smaller for mobile
  sm: 13,
  base: 15,
  lg: 17,
  // ...
}
```

---

## 5. 📐 Customizing Spacing (Advanced)

### Location in theme.js:
```javascript
spacing: {
  xs: 4,
  sm: 8,
  md: 16,
  lg: 24,
  xl: 32,
  '2xl': 48,
}
```

### When to Customize:
- If you want tighter/looser layouts
- To match specific design system
- For accessibility (larger touch targets)

---

## 🎯 Quick Branding Checklist

Use this checklist when rebranding:

```
□ Update all color values (primary, gradients, etc.)
□ Upload your logo images
□ Update logo URLs in theme.js
□ Update app icon URL
□ Update splash screen logo URL
□ Update company name
□ Update tagline
□ Update company description
□ Update contact email
□ Update contact phone
□ Update website URL
□ Adjust commission rates (if needed)
□ Adjust payment terms (if needed)
□ Test on device to see changes
□ Update app icon in assets/icon.png
□ Update splash screen in assets/splash.png
```

---

## 💡 Pro Tips

1. **Use High-Quality Images**: Logo should be at least 600px wide
2. **Transparent PNGs**: Logos work best with transparent backgrounds
3. **Consistent Colors**: Use only 2-3 main brand colors
4. **Test on Dark Mode**: If you plan to support dark mode
5. **Keep Original**: Save a copy of original theme.js before editing
6. **Use Color Picker**: Use a color picker tool to get exact hex codes
7. **Brand Guidelines**: Follow your existing brand guidelines
8. **Hot Reload**: Changes appear instantly when you save theme.js

---

## 📱 Updating App Icons

### iOS and Android Icons

1. **Create App Icon:**
   - Size: 1024x1024px
   - Format: PNG
   - No transparency
   - No rounded corners (system adds them)

2. **Place Icon:**
   - Save as `assets/icon.png`

3. **Expo Will Handle:**
   - Generating all required sizes
   - Platform-specific formats
   - Rounded corners (iOS)
   - Adaptive icons (Android)

### Splash Screen

1. **Create Splash Image:**
   - Size: 1242x2436px (or larger)
   - Format: PNG
   - Background color matches your brand

2. **Place Splash:**
   - Save as `assets/splash.png`

3. **Configure in app.config.js:**
```javascript
splash: {
  image: "./assets/splash.png",
  resizeMode: "contain",
  backgroundColor: "#0EA5E9"  // Your brand color
}
```

---

## 🔄 Seeing Your Changes

After editing `theme.js`:

1. **Save the file**
2. **Changes appear immediately** (hot reload)
3. **If not, shake phone** → "Reload"
4. **Or restart:** Stop server, run `npm start` again

---

## 📞 Common Questions

**Q: Do I need to restart the app after changing theme.js?**
A: No! Changes appear immediately with hot reload.

**Q: Can I use my company's exact colors?**
A: Yes! Just replace the hex codes with your brand colors.

**Q: Where do I host logo images?**
A: Any image hosting service (Imgur, Cloudinary, AWS, your website).

**Q: Can I change the gradient to solid color?**
A: Yes! Set gradientStart, gradientMiddle, and gradientEnd to the same color.

**Q: How do I remove XPOSE branding completely?**
A: Edit theme.js → change company.name, all logos, colors, and images.

**Q: Can I change font family?**
A: Yes, but requires additional setup (loading custom fonts with expo-font).

---

## ✅ Verification Checklist

After customization, verify:

```
□ Logo appears correctly on all screens
□ Colors look good on all backgrounds
□ Company name shows everywhere
□ Contact information is correct
□ Commission rates are as desired
□ Gradients look smooth
□ Icons are clear and visible
□ Text is readable on colored backgrounds
□ Buttons look clickable
□ Test on both light/bright screens
```

---

## 🎉 You're Done!

Your XPOSE mobile app is now fully branded with your company's identity!

**Remember:** All branding is in ONE file: `src/config/theme.js`

---

For technical help, see:
- `README.md` - Full documentation
- `SETUP_INSTRUCTIONS.md` - Detailed setup
- `QUICKSTART.md` - Quick start guide

Built with ❤️ for XPOSE
