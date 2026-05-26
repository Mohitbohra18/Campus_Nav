import React from 'react';

const Footer = ({ setActiveTab }) => {
  return (
    <footer className="premium-footer">
      <div className="footer-grid">
        {/* Column 1: Brand & Socials */}
        <div className="footer-about">
          <div className="footer-logo">
            <i className="fas fa-map-marked-alt"></i>
            <span>CAMPUSNAV-AI</span>
          </div>
          <p>
            An intelligent, high-fidelity spatial navigation and natural language NLP system designed to help students, faculties, and guests navigate the Graphic Era Hill University blocks effortlessly.
          </p>
          <div className="social-links">
            <a href="https://github.com/iamsonaliu" target="_blank" rel="noreferrer" className="social-btn">
              <i className="fab fa-github"></i>
            </a>
            <a href="https://www.linkedin.com/in/sonali-upadhyay-a75660283/" target="_blank" rel="noreferrer" className="social-btn">
              <i className="fab fa-linkedin-in"></i>
            </a>
            <a href="https://gehu.ac.in" target="_blank" rel="noreferrer" className="social-btn">
              <i className="fas fa-globe"></i>
            </a>
          </div>
        </div>

        {/* Column 2: Quick Links */}
        <div className="footer-column">
          <h3>Plan Campus Routes</h3>
          <ul>
            <li>
              <a href="#map" onClick={(e) => { e.preventDefault(); setActiveTab('map'); }}>
                Deemed Campus Map
              </a>
            </li>
            <li>
              <a href="#map" onClick={(e) => { e.preventDefault(); setActiveTab('map'); }}>
                Hill Campus Map
              </a>
            </li>
            <li>
              <a href="#map" onClick={(e) => { e.preventDefault(); setActiveTab('map'); }}>
                Hostels & Outside Areas
              </a>
            </li>
            <li>
              <a href="#chatbot" onClick={(e) => { e.preventDefault(); setActiveTab('chatbot'); }}>
                Ask AI Chatbot
              </a>
            </li>
          </ul>
        </div>

        {/* Column 3: Timing and Contacts */}
        <div className="footer-column footer-timings">
          <h3>Campus Information</h3>
          <p>
            <span>Opening Hours</span>
            Monday - Saturday: 9:00 AM - 5:00 PM<br />
            Sunday: Closed
          </p>
          <p style={{ marginTop: '0.5rem' }}>
            <span>Address</span>
            Clement Town, Dehradun, Uttarakhand 248002
          </p>
        </div>
      </div>

      {/* Footer Bottom copyright */}
      <div className="footer-bottom">
        <p>&copy; {new Date().getFullYear()} CAMPUSNAV-AI. All rights reserved.</p>
        <p>Graphic Era Hill University, Dehradun, Uttarakhand</p>
      </div>
    </footer>
  );
};

export default Footer;
