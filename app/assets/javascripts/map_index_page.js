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

addMarkers = function(latitude, longitude) {
  map.addMarker({
    lat: latitude,
    lng: longitude,
    icon: image,
    infoWindow:{
        content: '<p><b>WE STOCK BANANAS</b><img src="http://icons.iconarchive.com/icons/designbolts/despicable-me-2/64/Minion-Bananas-icon.png">'
    },
    mouseover: function(e){
                this.infoWindow.open(this.map, this);
            }                   
  });
};

setUserPosition = function(latitude, longitude) {
  userLatitude = latitude;
  userLongitude = longitude;
};

addAllMarkers = function(){
  for(var i = 0; i < data.length; i++){
    addMarkers(data[i][1], data[i][2]);
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
        addMarkers(latlng.lat(), latlng.lng());
        addAllMarkers();
        // adding a second permanent marker
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

$("#user-postcode").submit(function(event) {
  event.preventDefault();
  var userPostcode = $("#postcode").val();
  assembleMap(userPostcode);
});

$("#user-geolocation").on("click", function() {
  fetchLocation();
});

$(window).on('resize', function(){
  if (map) {
    map.setCenter(userLatitude, userLongitude);
  };
});
