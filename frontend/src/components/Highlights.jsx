import React from 'react';

const Highlights = ({ setActiveTab, setCampusMode }) => {
  const handleFeaturedClick = () => {
    setCampusMode('hill');
    setActiveTab('map');
    setTimeout(() => {
      document.getElementById('map-viewer')?.scrollIntoView({ behavior: 'smooth' });
    }, 100);
  };

  return (
    <section className="highlights-section">
      <div className="section-header">
        <h2>News & Features</h2>
      </div>

      <div className="highlights-grid">
        {/* Left Column: Featured Card */}
        <div className="featured-card">
          <div className="featured-img-container">
            <img src="/images/icons/deemed-campus.jpg" alt="GEHU Dehradun Campus" />
            <span className="tag-date">Active Updates</span>
          </div>
          <div className="featured-body">
            <h3>Interactive Indoor Navigation Active</h3>
            <p>
              We have completed scanning and compiling detailed floor nodes for the Graphic Era Hill University blocks! 
              You can now calculate precise step-by-step pathways between any two classrooms, staff rooms, or computer science labs instantly.
            </p>
            <a href="#map" onClick={(e) => { e.preventDefault(); handleFeaturedClick(); }} className="card-link">
              Launch Route Finder <i className="fas fa-arrow-right"></i>
            </a>
          </div>
        </div>

        {/* Right Column: Vertical list of updates */}
        <div className="highlights-list">
          <div className="list-item">
            <span className="item-date">Routing Technology</span>
            <h4>Advanced Graph Algorithms Integrated</h4>
            <p>
              Compare routes using Breadth-First Search (BFS) for the fewest turns or Dijkstra's Algorithm for the shortest metric physical distance.
            </p>
          </div>

          <div className="list-item">
            <span className="item-date">Natural Language NLP</span>
            <h4>Chatbot Integrated with Live MySQL Database</h4>
            <p>
              Ask our AI assistant natural questions like "Where is LT 201?" or "How to reach Lab 8?". The chatbot parses your query and retrieves records directly from the campus tables.
            </p>
          </div>

          <div className="list-item">
            <span className="item-date">Eco-Friendly Maps</span>
            <h4>Zero-cost OpenStreetMap (Leaflet) Integration</h4>
            <p>
              No proprietary API keys needed. Our routing maps are entirely built on open-source geographic maps, loaded dynamically with zero latency.
            </p>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Highlights;
