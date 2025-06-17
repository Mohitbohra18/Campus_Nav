// Enhanced Outside Navigation JavaScript with OpenStreetMap (FREE)
console.log('outside-navigation.js loaded successfully');

// Global variables
let map;
let markers = [];
let nodeData = new Map(); // Store node data with coordinates
let currentRoute = null;
let sourceMarker = null;
let destinationMarker = null;
let routePolyline = null;

// Initialize OpenStreetMap with Leaflet
function initMap() {
    // Default center for Outside Campus (you should update this to your actual campus coordinates)
    const defaultCenter = [30.7333, 76.7794]; // Default to Chandigarh coordinates
    
    map = L.map('map').setView(defaultCenter, 17);

    // Add OpenStreetMap tiles (FREE)
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    console.log('OpenStreetMap initialized with Leaflet');
}

// Load nodes with coordinates
async function loadNodes(campus) {
    console.log('=== loadNodes called ===');
    console.log('Campus parameter:', campus);

    const sourceSelect = document.getElementById('source');
    const destinationSelect = document.getElementById('destination');

    if (!sourceSelect || !destinationSelect) {
        console.error('DOM elements not found');
        return;
    }

    // Reset dropdowns
    sourceSelect.innerHTML = '<option value="" disabled selected>Select starting point</option>';
    destinationSelect.innerHTML = '<option value="" disabled selected>Select destination</option>';

    try {
        // First, get the list of node names
        const url = `/api/nodes?campus=${encodeURIComponent(campus)}&_=${Date.now()}`;
        console.log('Making request to:', url);

        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 5000);

        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Cache-Control': 'no-cache, no-store, must-revalidate',
                'Pragma': 'no-cache'
            },
            signal: controller.signal,
            cache: 'no-store'
        });

        clearTimeout(timeoutId);

        if (!response.ok) {
            throw new Error(`Failed to fetch nodes: ${response.status} ${response.statusText}`);
        }

        const nodeNames = await response.json();
        console.log('Received node names:', nodeNames);

        if (!Array.isArray(nodeNames) || nodeNames.length === 0) {
            console.warn('No nodes returned for campus:', campus);
            sourceSelect.innerHTML = '<option value="" disabled>No locations available</option>';
            destinationSelect.innerHTML = '<option value="" disabled>No locations available</option>';
            return;
        }

        // Now fetch detailed node data including coordinates
        const detailedNodes = await fetchNodeDetails(campus, nodeNames);
        console.log('Received detailed nodes:', detailedNodes);

        // Clear existing options
        sourceSelect.innerHTML = '<option value="" disabled selected>Select starting point</option>';
        destinationSelect.innerHTML = '<option value="" disabled selected>Select destination</option>';

        // Populate dropdowns and store node data
        detailedNodes.forEach(node => {
            if (node.latitude && node.longitude) {
                nodeData.set(node.name, {
                    lat: node.latitude,
                    lng: node.longitude,
                    name: node.name,
                    description: node.description || '',
                    type: node.type || ''
                });

                const option = document.createElement('option');
                option.value = node.name;
                option.textContent = node.name;
                sourceSelect.appendChild(option.cloneNode(true));
                destinationSelect.appendChild(option);

                // Add marker for the node
                addNodeMarker(node.latitude, node.longitude, node.name);
            }
        });

        // Update map bounds to show all markers
        if (markers.length > 0) {
            const group = new L.featureGroup(markers);
            map.fitBounds(group.getBounds());
        }

        console.log('Successfully populated dropdowns with', detailedNodes.length, 'nodes');
        
        // Add event listeners for dropdown changes
        sourceSelect.addEventListener('change', onSourceChange);
        destinationSelect.addEventListener('change', onDestinationChange);

    } catch (error) {
        console.error('Error in loadNodes:', error);
        sourceSelect.innerHTML = '<option value="" disabled>Error loading locations</option>';
        destinationSelect.innerHTML = '<option value="" disabled>Error loading locations</option>';
    }
}

// Fetch detailed node information including coordinates
async function fetchNodeDetails(campus, nodeNames) {
    try {
        const url = `/api/node-details?campus=${encodeURIComponent(campus)}`;
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(nodeNames)
        });

        if (!response.ok) {
            throw new Error(`Failed to fetch node details: ${response.status}`);
        }

        return await response.json();
    } catch (error) {
        console.error('Error fetching node details:', error);
        return [];
    }
}

// Add marker for a node
function addNodeMarker(lat, lng, title) {
    // Create custom icon for nodes
    const nodeIcon = L.divIcon({
        className: 'custom-node-marker',
        html: '<div style="background-color: #667eea; width: 24px; height: 24px; border-radius: 50%; border: 2px solid white; display: flex; align-items: center; justify-content: center;"><div style="background-color: white; width: 8px; height: 8px; border-radius: 50%;"></div></div>',
        iconSize: [24, 24],
        iconAnchor: [12, 12]
    });

    const marker = L.marker([lat, lng], { icon: nodeIcon })
        .addTo(map)
        .bindPopup(`<strong>${title}</strong>`);

    markers.push(marker);
}

// Handle source selection change
function onSourceChange() {
    const source = document.getElementById('source').value;
    if (source && nodeData.has(source)) {
        const node = nodeData.get(source);
        
        // Remove previous source marker
        if (sourceMarker) {
            map.removeLayer(sourceMarker);
        }

        // Create custom source icon
        const sourceIcon = L.divIcon({
            className: 'custom-source-marker',
            html: '<div style="background-color: #28a745; width: 32px; height: 32px; border-radius: 50%; border: 3px solid white; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; font-size: 12px;">S</div>',
            iconSize: [32, 32],
            iconAnchor: [16, 16]
        });

        // Add new source marker
        sourceMarker = L.marker([node.lat, node.lng], { icon: sourceIcon })
            .addTo(map)
            .bindPopup(`<strong>Source: ${node.name}</strong>`);

        updateRouteInfo();
    }
}

// Handle destination selection change
function onDestinationChange() {
    const destination = document.getElementById('destination').value;
    if (destination && nodeData.has(destination)) {
        const node = nodeData.get(destination);
        
        // Remove previous destination marker
        if (destinationMarker) {
            map.removeLayer(destinationMarker);
        }

        // Create custom destination icon
        const destIcon = L.divIcon({
            className: 'custom-dest-marker',
            html: '<div style="background-color: #dc3545; width: 32px; height: 32px; border-radius: 50%; border: 3px solid white; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; font-size: 12px;">D</div>',
            iconSize: [32, 32],
            iconAnchor: [16, 16]
        });

        // Add new destination marker
        destinationMarker = L.marker([node.lat, node.lng], { icon: destIcon })
            .addTo(map)
            .bindPopup(`<strong>Destination: ${node.name}</strong>`);

        updateRouteInfo();
    }
}

// Update route information display
function updateRouteInfo() {
    const source = document.getElementById('source').value;
    const destination = document.getElementById('destination').value;
    const routeInfo = document.getElementById('route-info');

    if (source && destination && nodeData.has(source) && nodeData.has(destination)) {
        const sourceNode = nodeData.get(source);
        const destNode = nodeData.get(destination);
        
        routeInfo.innerHTML = `
            <h3>📍 Route Information</h3>
            <p><strong>From:</strong> ${sourceNode.name}</p>
            <p><strong>To:</strong> ${destNode.name}</p>
            <p><strong>Coordinates:</strong></p>
            <p style="font-size: 0.8rem; color: #6c757d;">
                Source: (${sourceNode.lat.toFixed(6)}, ${sourceNode.lng.toFixed(6)})<br>
                Destination: (${destNode.lat.toFixed(6)}, ${destNode.lng.toFixed(6)})
            </p>
        `;
    } else {
        routeInfo.innerHTML = `
            <h3>📍 Route Information</h3>
            <p>Select source and destination to see route details</p>
        `;
    }
}

// Find path with enhanced functionality
async function findPath() {
    const source = document.getElementById('source').value;
    const destination = document.getElementById('destination').value;
    const algorithm = document.getElementById('algorithm').value;
    const resultDiv = document.getElementById('path');
    const findPathBtn = document.getElementById('findPathBtn');

    console.log('Finding path with inputs:', { source, destination, algorithm });

    // Clear previous styles
    resultDiv.classList.remove('error');

    // Validate inputs
    if (!source || !destination) {
        resultDiv.innerHTML = '<p class="error">Please select both source and destination.</p>';
        return;
    }
    if (source === destination) {
        resultDiv.innerHTML = '<p class="error">Source and destination cannot be the same.</p>';
        return;
    }

    // Show loading state
    findPathBtn.disabled = true;
    findPathBtn.innerHTML = '<span class="icon">⏳</span> Finding Route...';
    resultDiv.innerHTML = '<p class="placeholder">Calculating route...</p>';

    try {
        const campus = 'outer'; // Since this is outside navigation
        const url = `/api/navigate?from=${encodeURIComponent(source)}&to=${encodeURIComponent(destination)}&algorithm=${algorithm}&campus=${encodeURIComponent(campus)}`;
        console.log('Making request to:', url);

        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 5000);

        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            signal: controller.signal
        });

        clearTimeout(timeoutId);

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData[0] || `Network response was not ok: ${response.status}`);
        }

        const path = await response.json();
        console.log('Received path:', path);

        if (!Array.isArray(path) || path.length === 0) {
            resultDiv.innerHTML = '<p class="error">No path found.</p>';
        } else {
            // Display the path
            const pathHtml = `
                <div class="route-path">
                    <strong>Route:</strong><br>
                    ${path.join(' → ')}
                </div>
                <div class="route-stats">
                    <span>Steps: ${path.length - 1}</span>
                    <span>Algorithm: ${algorithm.toUpperCase()}</span>
                </div>
            `;
            resultDiv.innerHTML = pathHtml;

            // Show route on map
            showRouteOnMap(path);
        }
    } catch (error) {
        const errorMessage = error.message || 'An unknown error occurred';
        resultDiv.innerHTML = `<p class="error">Error: ${errorMessage}</p>`;
        console.error('Error in findPath:', error);
    } finally {
        // Reset button state
        findPathBtn.disabled = false;
        findPathBtn.innerHTML = '<span class="icon">🔍</span> Find Route';
    }
}

// Show route on OpenStreetMap
function showRouteOnMap(path) {
    if (path.length < 2) return;

    const source = path[0];
    const destination = path[path.length - 1];

    if (!nodeData.has(source) || !nodeData.has(destination)) {
        console.error('Source or destination not found in node data');
        return;
    }

    const sourceNode = nodeData.get(source);
    const destNode = nodeData.get(destination);

    // Remove previous route
    if (routePolyline) {
        map.removeLayer(routePolyline);
    }

    // Create a simple straight line route (you can enhance this with actual path coordinates)
    const routeCoordinates = [
        [sourceNode.lat, sourceNode.lng],
        [destNode.lat, destNode.lng]
    ];

    routePolyline = L.polyline(routeCoordinates, {
        color: '#667eea',
        weight: 4,
        opacity: 0.8
    }).addTo(map);

    // Fit map to show the route
    map.fitBounds(routePolyline.getBounds());

    // Calculate approximate distance
    const distance = calculateDistance(sourceNode.lat, sourceNode.lng, destNode.lat, destNode.lng);
    const estimatedTime = Math.ceil(distance / 80); // Assuming 80 meters per minute walking speed

    // Update route info with distance and duration
    const routeInfo = document.getElementById('route-info');
    routeInfo.innerHTML = `
        <h3>📍 Route Information</h3>
        <p><strong>From:</strong> ${sourceNode.name}</p>
        <p><strong>To:</strong> ${destNode.name}</p>
        <p><strong>Distance:</strong> ${distance.toFixed(0)} meters</p>
        <p><strong>Estimated Time:</strong> ${estimatedTime} minutes</p>
    `;
}

// Calculate distance between two points using Haversine formula
function calculateDistance(lat1, lon1, lat2, lon2) {
    const R = 6371e3; // Earth's radius in meters
    const φ1 = lat1 * Math.PI / 180;
    const φ2 = lat2 * Math.PI / 180;
    const Δφ = (lat2 - lat1) * Math.PI / 180;
    const Δλ = (lon2 - lon1) * Math.PI / 180;

    const a = Math.sin(Δφ / 2) * Math.sin(Δφ / 2) +
              Math.cos(φ1) * Math.cos(φ2) *
              Math.sin(Δλ / 2) * Math.sin(Δλ / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

    return R * c;
}

// Clear route from map
function clearRoute() {
    if (routePolyline) {
        map.removeLayer(routePolyline);
        routePolyline = null;
    }
    
    // Remove source and destination markers
    if (sourceMarker) {
        map.removeLayer(sourceMarker);
        sourceMarker = null;
    }
    if (destinationMarker) {
        map.removeLayer(destinationMarker);
        destinationMarker = null;
    }

    // Reset dropdowns
    document.getElementById('source').value = '';
    document.getElementById('destination').value = '';
    
    // Clear path display
    document.getElementById('path').innerHTML = '<p class="placeholder">Your route will appear here...</p>';
    
    // Reset route info
    document.getElementById('route-info').innerHTML = `
        <h3>📍 Route Information</h3>
        <p>Select source and destination to see route details</p>
    `;
}

// Open route in OpenStreetMap
function openInOpenStreetMap() {
    const source = document.getElementById('source').value;
    const destination = document.getElementById('destination').value;

    if (!source || !destination || !nodeData.has(source) || !nodeData.has(destination)) {
        alert('Please select both source and destination first.');
        return;
    }

    const sourceNode = nodeData.get(source);
    const destNode = nodeData.get(destination);

    const url = `https://www.openstreetmap.org/directions?from=${sourceNode.lat},${sourceNode.lng}&to=${destNode.lat},${destNode.lng}`;
    window.open(url, '_blank');
}

// Share route functionality
function shareRoute() {
    const source = document.getElementById('source').value;
    const destination = document.getElementById('destination').value;

    if (!source || !destination) {
        alert('Please select both source and destination first.');
        return;
    }

    const routeText = `Route from ${source} to ${destination} via CAMPUSNAV-AI`;
    const url = window.location.href;

    if (navigator.share) {
        navigator.share({
            title: 'CAMPUSNAV-AI Route',
            text: routeText,
            url: url
        });
    } else {
        // Fallback: copy to clipboard
        const shareText = `${routeText}\n${url}`;
        navigator.clipboard.writeText(shareText).then(() => {
            alert('Route information copied to clipboard!');
        }).catch(() => {
            alert('Route information:\n' + shareText);
        });
    }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    console.log('DOM loaded, initializing outside navigation with OpenStreetMap...');
    loadNodes('outer');
    initMap();
}); 