var centralUKLatitude = 54.559322;
var centralUKLongitude = -4.174804;

var defaultLatitude = centralUKLatitude;
var defaultLongitude = centralUKLongitude;

var screenWidth = $(window).width(); 
var defaultZoom;

if (screenWidth < 1280) {
  defaultZoom = 6;
} else {
  defaultZoom = 7;
}

var map;

generateMap = function() {
  map = new GMaps({
    div: '#map',
    lat: defaultLatitude,
    lng: defaultLongitude,
    zoom: defaultZoom
  });
};

generateMap();

if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition(function(position) {
    defaultLatitude = position.coords.latitude;
    defaultLongitude = position.coords.longitude;
    focusMap(defaultLatitude, defaultLongitude);
  });
};

focusMap = function(latitude, longitude) {
  map.setCenter(latitude, longitude);
    map.setZoom(15);
    map.addMarker({
      lat: latitude,
      lng: longitude
  });
};

fetchMap = function(postcode) {
  GMaps.geocode({
    address: postcode,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        focusMap(latlng.lat(), latlng.lng());
      }
    }
  });
};

$("#user-postcode").submit(function(event) {
  event.preventDefault();
  var postcode = $("#postcode").val();
  fetchMap(postcode);
});
