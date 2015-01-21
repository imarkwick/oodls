var screenWidth = $(window).width();
var defaultZoom;
var userLatitude, userLongitude;

if (screenWidth < 1280) {
  defaultZoom = 6;
} else {
  defaultZoom = 7;
}

// Need to test this method
if (!navigator.geolocation) {
  $("#user-geolocation").hide();
};

var map;

generateMap = function(latitude, longitude) {
  map = new GMaps({
    div: '#map',
    lat: latitude,
    lng: longitude,
    zoom: defaultZoom
  });
};

addMarkers = function(latitude, longitude) {
  map.addMarker({
    lat: latitude,
    lng: longitude
  });
};

setUserPosition = function(latitude, longitude) {
  userLatitude = latitude;
  userLongitude = longitude;
};

assembleMap = function(postcode) {
  GMaps.geocode({
    address: postcode,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        setUserPosition(latlng.lat(), latlng.lng())
        generateMap(latlng.lat(), latlng.lng());
        addMarkers(latlng.lat(), latlng.lng());
        map.setZoom(15);
      }
    }
  });
};

fetchLocation = function() {
  navigator.geolocation.getCurrentPosition(function(position) {
    setUserPosition(position.coords.latitude, position.coords.longitude)
    var browserCoordinates = position.coords.latitude + ", " + position.coords.longitude
    assembleMap(browserCoordinates);
  });
};

returnSearchBoxToTop = function () {
  $("#search-box").css({"top":"5%"});
};

$("#user-postcode").submit(function(event) {
  event.preventDefault();
  var userPostcode = $("#postcode").val();
  assembleMap(userPostcode);
  returnSearchBoxToTop();
});

$("#user-geolocation").on("click", function() {
  fetchLocation();
});

$(window).on('resize', function(){
  if (map) {
    map.setCenter(userLatitude, userLongitude);
  };
});
