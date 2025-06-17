let slideIndexes = {};

function initializeSlideshow(slideshowId) {
    slideIndexes[slideshowId] = 1;
    showSlides(slideIndexes[slideshowId], slideshowId);
}

function plusSlides(n, slideshowId) {
    showSlides(slideIndexes[slideshowId] += n, slideshowId);
}

function currentSlide(n, slideshowId) {
    showSlides(slideIndexes[slideshowId] = n, slideshowId);
}

function showSlides(n, slideshowId) {
    let i;
    let slideshowContainer = document.getElementById(slideshowId);
    if (!slideshowContainer) return;

    let slides = slideshowContainer.getElementsByClassName("slide");
    let dotsContainer = slideshowContainer.querySelector(".dots-container");
    let dots;

    if (slides.length === 0) return;

    // Create dots if they don't exist
    if (dotsContainer && dotsContainer.children.length === 0) {
        for (i = 0; i < slides.length; i++) {
            let dot = document.createElement("span");
            dot.className = "dot";
            dot.onclick = (function(index) {
                return function() {
                    currentSlide(index + 1, slideshowId);
                };
            })(i);
            dotsContainer.appendChild(dot);
        }
    }

    dots = dotsContainer ? dotsContainer.getElementsByClassName("dot") : [];

    if (n > slides.length) { slideIndexes[slideshowId] = 1; }
    if (n < 1) { slideIndexes[slideshowId] = slides.length; }

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
        slides[i].classList.remove("active", "fade"); // Remove active and fade classes
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }

    slides[slideIndexes[slideshowId]-1].style.display = "block";
    slides[slideIndexes[slideshowId]-1].classList.add("active", "fade"); // Add active and fade classes
    if (dots.length > 0) {
        dots[slideIndexes[slideshowId]-1].className += " active";
    }
}

// Initialize slideshows on page load
document.addEventListener('DOMContentLoaded', function() {
    initializeSlideshow('teamSlideshow');
    initializeSlideshow('combinedSlideshow');
}); 