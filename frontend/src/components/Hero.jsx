import React from 'react';

const Hero = ({ onNavigateClick }) => {
  return (
    <section className="hero">
      <div className="hero-content">
        <p className="hero-subtitle">GRAPHIC ERA HILL UNIVERSITY, DEHRADUN</p>
        <h1 className="hero-title">CAMPUSNAV-AI</h1>
        <p className="hero-desc">Navigate your way through campus — smarter, faster, effortlessly.</p>
        
        <div className="hero-widgets">
          <button 
            className="hero-widget-btn" 
            title="Explore Interactive Map"
            onClick={onNavigateClick}
          >
            <i className="fas fa-search-location"></i>
          </button>
          <button 
            className="hero-widget-btn" 
            title="Campus Helpline"
            onClick={() => window.open('https://gehu.ac.in', '_blank')}
          >
            <i className="fas fa-phone-alt"></i>
          </button>
        </div>
      </div>
      
      {/* Wave separator */}
      <div className="wave-divider">
        <svg viewBox="0 0 1440 60" preserveAspectRatio="none">
          <path d="M0,45 C320,75 640,15 960,45 C1280,75 1440,30 1440,30 L1440,60 L0,60 Z"></path>
        </svg>
      </div>
    </section>
  );
};

export default Hero;
