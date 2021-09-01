import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";

const initMapbox = () => {
  const mapElement = document.getElementById("map");

  // const fitMapToMarkers = (map, marker) => {
  //   const bounds = new mapboxgl.LngLatBounds();
  //   bounds.extend([marker.lng, marker.lat]);
  //   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  // };

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  const addMarkersToMap = (map, marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.backgroundRepeat = 'no-repeat';
    element.style.padding = '0';
    element.style.width = '30px';
    element.style.height = '30px';

    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup) // add this
      .addTo(map);
  };

  const addUserMarkersToMap = (map, userMarker) => {
    const element = document.createElement('div');
    element.className = 'user-marker';
    element.style.backgroundImage = `url('${userMarker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.backgroundRepeat = 'no-repeat';
    element.style.width = '30px';
    element.style.height = '30px';

    new mapboxgl.Marker(element)
      .setLngLat([userMarker.lng, userMarker.lat])
      .addTo(map);
  };

  async function getRoute(map, start, end) {
    // make directions request using cycling profile
    const query = await fetch(
      `https://api.mapbox.com/directions/v5/mapbox/walking/${start[0]},${start[1]};${end[0]},${end[1]}?geometries=geojson&access_token=${mapboxgl.accessToken}`,
      { method: 'GET' }
    );

    const json = await query.json();
    const data = json.routes[0];
    const route = data.geometry.coordinates;

    const geojson = {
      'type': 'Feature',
      'properties': {},
      'geometry': {
        'type': 'LineString',
        'coordinates': route
      }
    };

    map.addLayer({
      'id': 'route',
      'type': 'line',
      'source': {
        'type': 'geojson',
        'data': geojson
      },
      'layout': {
        'line-join': 'round',
        'line-cap': 'round'
      },
      'paint': {
        'line-color': '#6447F9',
        'line-width': 5,
        'line-opacity': 0.5
      }
    });
  };

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: "map",
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const marker     = JSON.parse(mapElement.dataset.marker);
    const userMarker = JSON.parse(mapElement.dataset.userMarker);

    const start = [userMarker.lng, userMarker.lat];
    const end   = [marker.lng, marker.lat];

    fitMapToMarkers(map, [marker, userMarker]);
    addMarkersToMap(map, marker);
    addUserMarkersToMap(map, userMarker);

    map.on('load', () => {
      getRoute(map, start, end);
    });
  };
}

export { initMapbox };
