import React from 'react';

const Navbar = ({ activeTab, setActiveTab, isDark, setIsDark }) => {
  const toggleTheme = () => {
    const nextDarkState = !isDark;
    setIsDark(nextDarkState);
    if (nextDarkState) {
      document.body.classList.add('dark-theme');
      localStorage.setItem('theme', 'dark');
    } else {
      document.body.classList.remove('dark-theme');
      localStorage.setItem('theme', 'light');
    }
  };

  return (
    <nav className="premium-nav">
      <div className="nav-content">
        <div className="brand" onClick={() => setActiveTab('home')} style={{ cursor: 'pointer' }}>
          <i className="fas fa-map-marked-alt"></i>
          <span className="brand-text">CAMPUSNAV-AI</span>
        </div>
        
        <ul className="nav-links">
          <li>
            <a 
              href="#home" 
              className={activeTab === 'home' ? 'active' : ''} 
              onClick={(e) => { e.preventDefault(); setActiveTab('home'); }}
            >
              Home
            </a>
          </li>
          <li>
            <a 
              href="#map" 
              className={activeTab === 'map' ? 'active' : ''} 
              onClick={(e) => { e.preventDefault(); setActiveTab('map'); }}
            >
              Interactive Map
            </a>
          </li>
          <li>
            <a 
              href="#chatbot" 
              className={activeTab === 'chatbot' ? 'active' : ''} 
              onClick={(e) => { e.preventDefault(); setActiveTab('chatbot'); }}
            >
              AI Chatbot
            </a>
          </li>
        </ul>

        <div className="nav-actions">
          <button onClick={toggleTheme} className="theme-btn" aria-label="Toggle theme">
            {isDark ? <i className="fas fa-sun"></i> : <i className="fas fa-moon"></i>}
          </button>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
