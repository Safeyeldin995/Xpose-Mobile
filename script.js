// XPOSE - Egypt's Digital Media Marketplace JavaScript

// Categories Slider Functions
function slideCategories(direction) {
    const slider = document.getElementById('categoriesSlider');
    const scrollAmount = 380;
    
    if (direction === 'next') {
        slider.scrollLeft += scrollAmount;
    } else {
        slider.scrollLeft -= scrollAmount;
    }
}

// Login Modal Functions
function openLoginModal(type) {
    const modal = document.getElementById('loginModal');
    modal.classList.add('active');
    
    if (type === 'supplier') {
        switchTab('supplier');
    } else {
        switchTab('client');
    }
}

function closeLoginModal() {
    const modal = document.getElementById('loginModal');
    modal.classList.remove('active');
}

function switchTab(type) {
    // Update tabs
    const clientTab = document.getElementById('clientTab');
    const supplierTab = document.getElementById('supplierTab');
    
    clientTab.classList.remove('active');
    supplierTab.classList.remove('active');
    
    if (type === 'client') {
        clientTab.classList.add('active');
    } else {
        supplierTab.classList.add('active');
    }
    
    // Update forms
    const clientForm = document.getElementById('clientForm');
    const supplierForm = document.getElementById('supplierForm');
    
    clientForm.classList.remove('active');
    supplierForm.classList.remove('active');
    
    if (type === 'client') {
        clientForm.classList.add('active');
    } else {
        supplierForm.classList.add('active');
    }
}

// Form Submission Handler
function handleSubmit(event, type) {
    event.preventDefault();
    alert(`${type} login feature coming soon! You will be redirected to the ${type} dashboard.`);
    return false;
}

// Smooth Scroll Function
function scrollToSection(sectionId) {
    const element = document.getElementById(sectionId);
    if (element) {
        element.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });
    }
}

// Close Modal on Outside Click
document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById('loginModal');
    
    modal.addEventListener('click', function(e) {
        if (e.target === modal) {
            closeLoginModal();
        }
    });
    
    // Smooth scroll for navigation links
    const navLinks = document.querySelectorAll('a[href^="#"]');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            scrollToSection(targetId);
        });
    });
});

// Keyboard Navigation for Modal
document.addEventListener('keydown', function(e) {
    const modal = document.getElementById('loginModal');
    
    if (e.key === 'Escape' && modal.classList.contains('active')) {
        closeLoginModal();
    }
});

// Auto-hide navigation on scroll (optional enhancement)
let lastScroll = 0;
const nav = document.querySelector('nav');

window.addEventListener('scroll', function() {
    const currentScroll = window.pageYOffset;
    
    if (currentScroll <= 0) {
        nav.style.transform = 'translateY(0)';
    }
    
    lastScroll = currentScroll;
});

// Add animation on scroll for sections (optional enhancement)
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe all sections for animation
document.addEventListener('DOMContentLoaded', function() {
    const sections = document.querySelectorAll('section');
    sections.forEach(section => {
        section.style.opacity = '0';
        section.style.transform = 'translateY(20px)';
        section.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(section);
    });
});
