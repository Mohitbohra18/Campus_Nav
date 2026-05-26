import React from 'react';

const QuickAccess = ({ setActiveTab, setCampusMode }) => {
  const handleMapRedirect = (mode) => {
    setCampusMode(mode);
    setActiveTab('map');
    // Smooth scroll to map
    setTimeout(() => {
      const element = document.getElementById('map-viewer');
      if (element) {
        element.scrollIntoView({ behavior: 'smooth' });
      }
    }, 100);
  };

  return (
    <div className="quick-access-wrapper">
      <div className="quick-access-container">
        {/* Card 1: Indoor Map */}
        <div className="quick-card" onClick={() => handleMapRedirect('hill')}>
          <div className="quick-circle">
            <i className="fas fa-route"></i>
          </div>
          <h3>Indoor Navigation</h3>
          <p>Find classroom halls, labs, administrative offices, and stairs inside the campus blocks.</p>
        </div>

        {/* Card 2: Outdoor Map */}
        <div className="quick-card" onClick={() => handleMapRedirect('outer')}>
          <div className="quick-circle">
            <i className="fas fa-campground"></i>
          </div>
          <h3>Outdoor Navigation</h3>
          <p>Find hostels, cafeterias, sports arenas, and gates connecting the hill campus.</p>
        </div>

        {/* Card 3: AI Chatbot */}
        <div className="quick-card" onClick={() => setActiveTab('chatbot')}>
          <div className="quick-circle">
            <i className="fas fa-robot"></i>
          </div>
          <h3>AI Chatbot</h3>
          <p>Instantly search facility locations, room codes, and campus details using natural speech.</p>
        </div>
      </div>
    </div>
  );
};

export default QuickAccess;
