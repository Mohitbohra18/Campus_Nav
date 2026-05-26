import React from 'react';

const MapCallout = ({ setActiveTab }) => {
  const handleCalloutClick = () => {
    setActiveTab('map');
    setTimeout(() => {
      document.getElementById('map-viewer')?.scrollIntoView({ behavior: 'smooth' });
    }, 100);
  };

  return (
    <section className="map-callout">
      <div className="map-callout-content">
        {/* Left Column: Text */}
        <div className="callout-text">
          <h2>The Campus Territory</h2>
          <p>
            Nestled at the foothills of the Himalayas, the Graphic Era Hill University campus blends beautiful natural terrains with state-of-the-art academic blocks. 
            Our interactive navigation map overlays custom coordinate nodes directly on open geographic maps to guide you across all departments, seminar halls, and scenic viewing spots.
          </p>
          <button className="callout-btn" onClick={handleCalloutClick}>
            VIEW INTERACTIVE MAP
          </button>
        </div>

        {/* Right Column: Outline Map Overlay Preview */}
        <div className="callout-map-card">
          <div className="map-overlay-preview">
            <div className="preview-title">
              <i className="fas fa-route"></i>
              <span>Interactive Path Preview</span>
            </div>
            
            <div className="preview-locations">
              <div className="preview-loc">
                <i className="fas fa-map-marker-alt" style={{ color: '#28a745' }}></i>
                <span>From: <strong>Gate No. 1 (Entrance)</strong></span>
              </div>
              <div className="preview-loc">
                <i className="fas fa-flag-checkered" style={{ color: '#dc3545' }}></i>
                <span>To: <strong>Computer Centre (Ubuntu Lab)</strong></span>
              </div>
            </div>

            <div className="preview-route-line"></div>
            
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '0.8rem', color: '#6c757d', fontWeight: 'bold' }}>
              <span>Distance: ~180 meters</span>
              <span>Walking Time: ~2 mins</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default MapCallout;
