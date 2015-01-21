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

  var image = {
    url: 'http://upload.wikimedia.org/wikipedia/en/thumb/9/99/LeedsUnitedB.png/110px-LeedsUnitedB.png',
    size: new google.maps.Size(110, 110),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(55,55)
  };

addUserMarker = function(latitude, longitude) {
  map.addMarker({
    lat: latitude,
    lng: longitude                 
  });
};

setUserPosition = function(latitude, longitude) {
  userLatitude = latitude;
  userLongitude = longitude;
};

addCharityMarkers = function(){
  for(var i in charity_data){
    var requirements = $.map(charity_data[i].requirements, function(req) { return req.label; }).join(", ");
    var charity_info = "<p><b>" + charity_data[i].organisation + "</b><p>We are currently accepting </p>" + requirements;
    map.addMarker({
      lat: charity_data[i].lat, 
      lng: charity_data[i].lon,
      icon: image,
      infoWindow:{
        content: charity_info
      },
      mouseover: function(e){
        this.infoWindow.open(this.map, this);
      }    
    });
  };
};

assembleMap = function(postcode) {
  GMaps.geocode({
    address: postcode,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        setUserPosition(latlng.lat(), latlng.lng())
        generateMap(latlng.lat(), latlng.lng());
        addUserMarker(latlng.lat(), latlng.lng());
        addCharityMarkers();
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
  $("#search-box").css({"top":"3.2em"});
};

$("#user-postcode").submit(function(event) {
  event.preventDefault();
  var userPostcode = $("#postcode").val();
  assembleMap(userPostcode);
  returnSearchBoxToTop();
});

$("#user-geolocation").on("click", function() {
  fetchLocation();
  returnSearchBoxToTop();
});

$(window).on('resize', function(){
  if (map) {
    map.setCenter(userLatitude, userLongitude);
  };
});
