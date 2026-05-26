import React, { useState, useEffect } from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import QuickAccess from './components/QuickAccess';
import Highlights from './components/Highlights';
import MapCallout from './components/MapCallout';
import MapViewer from './components/MapViewer';
import ChatbotViewer from './components/ChatbotViewer';
import Footer from './components/Footer';

function App() {
  const [activeTab, setActiveTab] = useState('home');
  const [campusMode, setCampusMode] = useState('hill'); // 'deemed', 'hill', 'outer'
  const [isDark, setIsDark] = useState(false);

  // Initialize theme from localStorage on mount
  useEffect(() => {
    const savedTheme = localStorage.getItem('theme') || 'light';
    if (savedTheme === 'dark') {
      setIsDark(true);
      document.body.classList.add('dark-theme');
    } else {
      setIsDark(false);
      document.body.classList.remove('dark-theme');
    }
  }, []);

  return (
    <div className="app-container">
      {/* 1. Header Navigation */}
      <Navbar 
        activeTab={activeTab} 
        setActiveTab={setActiveTab} 
        isDark={isDark} 
        setIsDark={setIsDark} 
      />

      {/* Spacer to push content down below fixed fixed Navbar */}
      <div style={{ height: '70px', width: '100%' }}></div>

      {/* 2. Tab Routing */}
      {activeTab === 'home' && (
        <>
          <Hero onNavigateClick={() => { setActiveTab('map'); }} />
          <QuickAccess setActiveTab={setActiveTab} setCampusMode={setCampusMode} />
          <Highlights setActiveTab={setActiveTab} setCampusMode={setCampusMode} />
          <MapCallout setActiveTab={setActiveTab} />
        </>
      )}

      {activeTab === 'map' && (
        <div style={{ animation: 'fadeInDown 0.5s ease' }}>
          <MapViewer campusMode={campusMode} setCampusMode={setCampusMode} />
        </div>
      )}

      {activeTab === 'chatbot' && (
        <div style={{ animation: 'fadeInDown 0.5s ease' }}>
          <ChatbotViewer />
        </div>
      )}

      {/* 3. Footer */}
      <Footer setActiveTab={setActiveTab} />
    </div>
  );
}

export default App;
