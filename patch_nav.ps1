
# Patch navigation JS files with OSRM segment-by-segment road routing
$files = @(
    'c:\projects\campus\src\main\resources\static\js\outside-navigation.js',
    'c:\projects\campus\src\main\resources\static\js\hill-navigation.js',
    'c:\projects\campus\src\main\resources\static\js\deemed-navigation.js'
)

$newRouteFn = @'

// Show route: instant dashed preview, then upgrades to real road route via OSRM (segment-by-segment)
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

    // Instant dashed straight-line preview
    var previewCoords = waypoints.map(function(wp) { return [wp.lat, wp.lng]; });
    var glow = L.polyline(previewCoords, {
        color: '#a78bfa', weight: 10, opacity: 0.18, lineJoin: 'round', lineCap: 'round'
    }).addTo(map);
    var previewLine = L.polyline(previewCoords, {
        color: '#667eea', weight: 5, opacity: 0.55, dashArray: '8,5', lineJoin: 'round', lineCap: 'round'
    }).addTo(map);
    routePolyline = [glow, previewLine];
    map.fitBounds(previewLine.getBounds(), { padding: [50, 50] });

    var estDist = 0;
    for (var k = 0; k < waypoints.length - 1; k++) {
        estDist += calculateDistance(waypoints[k].lat, waypoints[k].lng,
                                     waypoints[k+1].lat, waypoints[k+1].lng);
    }
    var routeInfo = document.getElementById('route-info');
    routeInfo.innerHTML =
        '<h3>\uD83D\uDCCD Route Information</h3>' +
        '<p><strong>From:</strong> ' + sourceNode.name + '</p>' +
        '<p><strong>To:</strong> ' + destNode.name + '</p>' +
        '<p><strong>Est. Distance:</strong> ~' + Math.round(estDist) + ' m</p>' +
        '<p><strong>Est. Walking:</strong> ~' + Math.ceil(estDist/80) + ' min</p>' +
        '<p id="osrm-status" style="font-size:0.75rem;color:#f59e0b;margin-top:4px;">\u23F3 Loading road route\u2026</p>';

    // Async upgrade to real road route per consecutive segment
    (async function() {
        var allCoords = [];
        var totalDist = 0, totalDur = 0;
        try {
            for (var i = 0; i < waypoints.length - 1; i++) {
                var a = waypoints[i], b = waypoints[i+1];
                var url = 'https://router.project-osrm.org/route/v1/foot/' +
                    a.lng + ',' + a.lat + ';' + b.lng + ',' + b.lat +
                    '?overview=full&geometries=geojson';
                var res = await fetch(url, { signal: AbortSignal.timeout(8000) });
                if (!res.ok) throw new Error('HTTP ' + res.status);
                var data = await res.json();
                if (data.code !== 'Ok' || !data.routes || !data.routes.length) throw new Error('No route seg ' + i);
                var seg = data.routes[0].geometry.coordinates.map(function(c) { return [c[1], c[0]]; });
                allCoords = allCoords.length ? allCoords.concat(seg.slice(1)) : seg;
                totalDist += data.routes[0].distance;
                totalDur  += data.routes[0].duration;
            }
            if (allCoords.length < 2) throw new Error('Empty geometry');

            // Replace preview with real road polylines
            if (routePolyline) {
                if (Array.isArray(routePolyline)) {
                    routePolyline.forEach(function(l) { map.removeLayer(l); });
                } else { map.removeLayer(routePolyline); }
            }
            var roadGlow = L.polyline(allCoords, {
                color: '#a78bfa', weight: 10, opacity: 0.22, lineJoin: 'round', lineCap: 'round'
            }).addTo(map);
            var roadLine = L.polyline(allCoords, {
                color: '#667eea', weight: 5, opacity: 0.95, lineJoin: 'round', lineCap: 'round'
            }).addTo(map);
            routePolyline = [roadGlow, roadLine];
            map.fitBounds(roadLine.getBounds(), { padding: [50, 50] });

            var distStr = totalDist >= 1000 ? (totalDist/1000).toFixed(2) + ' km' : Math.round(totalDist) + ' m';
            var mins = Math.ceil(totalDur / 60);
            var timeStr = mins < 60 ? mins + ' min' : Math.floor(mins/60) + 'h ' + (mins%60) + 'm';

            routeInfo.innerHTML =
                '<h3>\uD83D\uDCCD Route Information</h3>' +
                '<p><strong>From:</strong> ' + sourceNode.name + '</p>' +
                '<p><strong>To:</strong> ' + destNode.name + '</p>' +
                '<p><strong>Distance:</strong> ' + distStr + '</p>' +
                '<p><strong>Walking Time:</strong> ' + timeStr + '</p>' +
                '<p style="font-size:0.75rem;color:#a78bfa;margin-top:4px;">\uD83D\uDEE3\uFE0F Road route via OSRM</p>';

        } catch(err) {
            console.warn('OSRM segment routing failed:', err.message);
            var status = document.getElementById('osrm-status');
            if (status) { status.textContent = '\u26A0\uFE0F Showing estimated route'; }
        }
    })();
}

'@

# Patterns to find and replace (the entire showRouteOnMap function body)
# We look for the function start marker line and replace until the closing brace + empty line before calculateDistance
foreach ($file in $files) {
    Write-Host "Patching: $file"
    $content = [System.IO.File]::ReadAllText($file)

    # Find the start of showRouteOnMap
    $startMarker = '// Show route on map connecting each node in the path sequentially'
    $endMarker = '// Calculate distance between two points using Haversine formula'

    $startIdx = $content.IndexOf($startMarker)
    $endIdx   = $content.IndexOf($endMarker)

    if ($startIdx -lt 0 -or $endIdx -lt 0) {
        Write-Host "  ERROR: markers not found in $file"
        continue
    }

    $before = $content.Substring(0, $startIdx)
    $after  = $content.Substring($endIdx)

    $newContent = $before + $newRouteFn + $after

    [System.IO.File]::WriteAllText($file, $newContent, [System.Text.UTF8Encoding]::new($false))
    Write-Host "  Done: replaced showRouteOnMap"
}

Write-Host "All files patched successfully."
