
# Fix outside-navigation.js: use single OSRM call (source to destination only)
# This matches how OpenStreetMap routes - 2 points, OSRM finds the best road path

$file = 'c:\projects\campus\src\main\resources\static\js\outside-navigation.js'
$content = [System.IO.File]::ReadAllText($file)

$startMarker = '// Show route: instant dashed preview, then upgrades to real road route via OSRM (segment-by-segment)'
$endMarker   = '// Calculate distance between two points using Haversine formula'

$startIdx = $content.IndexOf($startMarker)
$endIdx   = $content.IndexOf($endMarker)

if ($startIdx -lt 0 -or $endIdx -lt 0) {
    Write-Host "ERROR: markers not found. startIdx=$startIdx endIdx=$endIdx"
    exit 1
}

$newRouteFn = @'

// Show route on map: direct source to destination OSRM road route (like OpenStreetMap)
// OSRM is called with just 2 points - it finds the best road automatically.
// Intermediate campus nodes appear in the route text list but are NOT sent to OSRM as waypoints.
function showRouteOnMap(path) {
    if (path.length < 2) return;

    // Remove previous route layers
    if (routePolyline) {
        if (Array.isArray(routePolyline)) {
            routePolyline.forEach(function(layer) { map.removeLayer(layer); });
        } else {
            map.removeLayer(routePolyline);
        }
        routePolyline = null;
    }

    var waypoints = path
        .filter(function(name) { return nodeData.has(name); })
        .map(function(name) { return nodeData.get(name); });

    if (waypoints.length < 2) { console.error('Not enough waypoints'); return; }

    var sourceNode = waypoints[0];
    var destNode   = waypoints[waypoints.length - 1];

    // Instant straight-line preview while OSRM loads
    var previewCoords = [[sourceNode.lat, sourceNode.lng], [destNode.lat, destNode.lng]];
    var glow = L.polyline(previewCoords, {
        color: '#a78bfa', weight: 10, opacity: 0.18, lineJoin: 'round', lineCap: 'round'
    }).addTo(map);
    var previewLine = L.polyline(previewCoords, {
        color: '#667eea', weight: 5, opacity: 0.55, dashArray: '8,5', lineJoin: 'round', lineCap: 'round'
    }).addTo(map);
    routePolyline = [glow, previewLine];
    map.fitBounds(L.latLngBounds(previewCoords), { padding: [60, 60] });

    var estDist = calculateDistance(sourceNode.lat, sourceNode.lng, destNode.lat, destNode.lng);
    var routeInfo = document.getElementById('route-info');
    routeInfo.innerHTML =
        '<h3>Route Information</h3>' +
        '<p><strong>From:</strong> ' + sourceNode.name + '</p>' +
        '<p><strong>To:</strong> ' + destNode.name + '</p>' +
        '<p><strong>Est. Distance:</strong> ~' + Math.round(estDist) + ' m</p>' +
        '<p><strong>Est. Walking:</strong> ~' + Math.ceil(estDist/80) + ' min</p>' +
        '<p id="osrm-status" style="font-size:0.75rem;color:#f59e0b;margin-top:4px;">Loading road route...</p>';

    // Single OSRM call: source to destination only - matches OpenStreetMap behaviour
    (async function() {
        try {
            var url = 'https://router.project-osrm.org/route/v1/foot/' +
                sourceNode.lng + ',' + sourceNode.lat + ';' +
                destNode.lng   + ',' + destNode.lat +
                '?overview=full&geometries=geojson';

            var res = await fetch(url, { signal: AbortSignal.timeout(10000) });
            if (!res.ok) throw new Error('HTTP ' + res.status);

            var data = await res.json();
            if (data.code !== 'Ok' || !data.routes || !data.routes.length) {
                throw new Error('No route returned by OSRM');
            }

            var coords = data.routes[0].geometry.coordinates.map(function(c) { return [c[1], c[0]]; });
            var totalDist = data.routes[0].distance;
            var totalDur  = data.routes[0].duration;

            if (coords.length < 2) throw new Error('Empty geometry');

            // Replace preview with real road-following polyline
            if (routePolyline) {
                if (Array.isArray(routePolyline)) {
                    routePolyline.forEach(function(l) { map.removeLayer(l); });
                } else { map.removeLayer(routePolyline); }
            }

            var roadGlow = L.polyline(coords, {
                color: '#a78bfa', weight: 10, opacity: 0.22, lineJoin: 'round', lineCap: 'round'
            }).addTo(map);
            var roadLine = L.polyline(coords, {
                color: '#667eea', weight: 5, opacity: 0.95, lineJoin: 'round', lineCap: 'round'
            }).addTo(map);
            routePolyline = [roadGlow, roadLine];
            map.fitBounds(roadLine.getBounds(), { padding: [50, 50] });

            var distStr = totalDist >= 1000
                ? (totalDist / 1000).toFixed(2) + ' km'
                : Math.round(totalDist) + ' m';
            var mins = Math.ceil(totalDur / 60);
            var timeStr = mins < 60 ? mins + ' min' : Math.floor(mins/60) + 'h ' + (mins%60) + 'm';

            routeInfo.innerHTML =
                '<h3>Route Information</h3>' +
                '<p><strong>From:</strong> ' + sourceNode.name + '</p>' +
                '<p><strong>To:</strong> ' + destNode.name + '</p>' +
                '<p><strong>Distance:</strong> ' + distStr + '</p>' +
                '<p><strong>Walking Time:</strong> ' + timeStr + '</p>' +
                '<p style="font-size:0.75rem;color:#a78bfa;margin-top:4px;">Road route via OSRM</p>';

        } catch(err) {
            console.warn('OSRM road routing failed:', err.message);
            var status = document.getElementById('osrm-status');
            if (status) {
                status.textContent = 'Showing straight-line estimate';
                status.style.color = '#f59e0b';
            }
        }
    })();
}

'@

$before = $content.Substring(0, $startIdx)
$after  = $content.Substring($endIdx)
$newContent = $before + $newRouteFn + $after
[System.IO.File]::WriteAllText($file, $newContent, [System.Text.UTF8Encoding]::new($false))
Write-Host "outside-navigation.js patched successfully."
