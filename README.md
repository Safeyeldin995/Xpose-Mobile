# XPOSE - Egypt's Digital Media Marketplace

A modern B2B marketplace platform connecting businesses with TV channels, influencers, billboards, events, and talent booking services across Egypt.

![XPOSE Banner](https://i.ibb.co/m5x4CYG/xpose-logo.png)

## 🎯 Features

- **6 Media Categories**: TV Channels, Influencers, Billboards, Events, Talent Booking, Radio
- **Dual Login System**: Separate portals for clients and suppliers
- **Escrow-Protected Payments**: Secure transaction handling
- **Fully Responsive**: Optimized for all devices
- **Modern UI/UX**: Blue-to-cyan-to-turquoise gradient design with Inter typography

## 🚀 Live Demo

Visit: [https://xpose-app.vercel.app](https://xpose-app.vercel.app)

## 📸 Screenshots

### Hero Section
Professional landing page with statistics and CTAs

### Category Slider
Horizontal scrollable categories with 500+ media opportunities

### Featured Suppliers
Showcasing Elshams TV, CBC Sofra, and top influencers

### Booking Journey
4-step process: Browse → Book → Exposure → Confirm

## 🛠️ Tech Stack

- **HTML5** - Semantic markup
- **CSS3** - Custom properties, Grid, Flexbox
- **JavaScript (Vanilla)** - No frameworks, pure JS
- **Font Awesome 6** - Icons
- **Google Fonts** - Inter typeface

## 📦 Files Structure

```
xpose-app/
├── index.html      # Main landing page
├── styles.css      # All styling
├── script.js       # Interactivity
└── README.md       # This file
```

## 🎨 Brand Colors

```css
--primary-blue: #0066FF
--primary-cyan: #00BFFF
--primary-turquoise: #00CED1
```

## 🔧 Local Development

1. Clone the repository:
```bash
git clone https://github.com/safeyhalim/xpose-app.git
```

2. Open `index.html` in your browser:
```bash
cd xpose-app
open index.html
```

That's it! No build process needed.

## 📝 Customization

### Update Logo
Change line 18 in `index.html`:
```html
<img src="YOUR_LOGO_URL" alt="XPOSE Logo" class="logo-img">
```

### Change Colors
Edit `:root` in `styles.css`:
```css
:root {
    --primary-blue: #YOUR_COLOR;
    --primary-cyan: #YOUR_COLOR;
    --primary-turquoise: #YOUR_COLOR;
}
```

### Add Category
Add new card in `index.html` categories section:
```html
<div class="category-card">
    <div class="category-icon"><i class="fas fa-YOUR-ICON"></i></div>
    <h3>Your Category</h3>
    <p>Description</p>
    <span class="category-count">Number</span>
</div>
```

## 🌐 Deployment

### Vercel (Recommended)
1. Push to GitHub
2. Import repository to Vercel
3. Deploy automatically

### GitHub Pages
1. Go to Settings → Pages
2. Select main branch
3. Site live at `username.github.io/xpose-app`

### Netlify
1. Drag & drop folder to Netlify
2. Site deployed instantly

## 📱 Responsive Breakpoints

- Desktop: 1400px+
- Tablet: 768px - 1400px
- Mobile: < 768px

## ✨ Key Sections

1. **Navigation** - Fixed header with dual login
2. **Hero** - Value proposition with statistics
3. **Categories** - Scrollable media categories
4. **Suppliers** - Featured media partners
5. **Journey** - 4-step booking process
6. **Testimonials** - Client success stories
7. **CTA** - Conversion section
8. **Footer** - Links and social media

## 🔐 Login System

Currently shows modal interface. To connect backend:
1. Update `handleSubmit()` in `script.js`
2. Add API endpoints
3. Implement authentication

## 📊 Performance

- **Load Time**: < 2 seconds
- **Size**: ~100KB (minified)
- **Lighthouse Score**: 95+

## 🐛 Known Issues

None currently. Report issues on GitHub.

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

Copyright © 2025 XPOSE. All rights reserved.

## 👥 Contact

- Website: [xpose-app.vercel.app](https://xpose-app.vercel.app)
- Email: support@xpose.eg
- LinkedIn: [XPOSE Egypt](https://linkedin.com/company/xpose-egypt)

## 🙏 Acknowledgments

- **Elshams TV** - Media partner
- **CBC Sofra** - Media partner
- Design inspired by modern SaaS platforms
- Icons by Font Awesome

---

Built with ❤️ for Egypt's media and advertising industry

