
# Revert hill and deemed navigation to direct campus-node routing (no OSRM)
# OSRM is only suitable for outside-campus (public roads)
# Inside campus: connect route nodes directly - they represent actual campus paths

$insideFiles = @(
    'c:\projects\campus\src\main\resources\static\js\hill-navigation.js',
    'c:\projects\campus\src\main\resources\static\js\deemed-navigation.js'
)

$campusRouteFn = @'

// Show campus route: draw path directly through the algorithm's nodes
// These nodes represent actual campus paths, so direct connection is correct.
// OSRM is NOT used here - it routes via public roads outside campus.
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

    // Connect each consecutive campus node directly - these are the actual campus paths
    var coords = waypoints.map(function(wp) { return [wp.lat, wp.lng]; });

    // Soft glow layer
    var glowLayer = L.polyline(coords, {
        color: '#a78bfa', weight: 10, opacity: 0.22,
        lineJoin: 'round', lineCap: 'round'
    }).addTo(map);

    // Main campus path line
    var mainLine = L.polyline(coords, {
        color: '#667eea', weight: 5, opacity: 0.95,
        lineJoin: 'round', lineCap: 'round'
    }).addTo(map);

    routePolyline = [glowLayer, mainLine];
    map.fitBounds(mainLine.getBounds(), { padding: [50, 50] });

    // Calculate cumulative path distance
    var totalDist = 0;
    for (var i = 0; i < waypoints.length - 1; i++) {
        totalDist += calculateDistance(
            waypoints[i].lat, waypoints[i].lng,
            waypoints[i+1].lat, waypoints[i+1].lng
        );
    }
    var estMin = Math.ceil(totalDist / 80);
    var distStr = totalDist >= 1000
        ? (totalDist / 1000).toFixed(2) + ' km'
        : Math.round(totalDist) + ' m';

    var routeInfo = document.getElementById('route-info');
    routeInfo.innerHTML =
        '<h3>\uD83D\uDCCD Route Information</h3>' +
        '<p><strong>From:</strong> ' + sourceNode.name + '</p>' +
        '<p><strong>To:</strong> ' + destNode.name + '</p>' +
        '<p><strong>Stops:</strong> ' + waypoints.length + ' campus nodes</p>' +
        '<p><strong>Campus Distance:</strong> ~' + distStr + '</p>' +
        '<p><strong>Walking Time:</strong> ~' + estMin + ' min</p>' +
        '<p style="font-size:0.75rem;color:#a78bfa;margin-top:4px;">\uD83C\uDFEB Campus internal path</p>';

    console.log('Campus route drawn through ' + waypoints.length + ' nodes, ~' + distStr);
}

'@

$startMarker = '// Show route: instant dashed preview, then upgrades to real road route via OSRM (segment-by-segment)'
$endMarker   = '// Calculate distance between two points using Haversine formula'

foreach ($file in $insideFiles) {
    Write-Host "Patching: $file"
    $content = [System.IO.File]::ReadAllText($file)

    $startIdx = $content.IndexOf($startMarker)
    $endIdx   = $content.IndexOf($endMarker)

    if ($startIdx -lt 0 -or $endIdx -lt 0) {
        Write-Host "  ERROR: markers not found. Start=$startIdx, End=$endIdx"
        continue
    }

    $before = $content.Substring(0, $startIdx)
    $after  = $content.Substring($endIdx)

    $newContent = $before + $campusRouteFn + $after
    [System.IO.File]::WriteAllText($file, $newContent, [System.Text.UTF8Encoding]::new($false))
    Write-Host "  Done: campus route applied"
}

Write-Host "Inside-campus navigation files patched successfully."
