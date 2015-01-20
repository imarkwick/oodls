
var centralUKLat = 54.559322;
var centralUKLong = -4.174804;

var screenWidth = $(window).width(); 

var defaultZoom;

if (screenWidth < 1280) {
  defaultZoom = 6;
} else {
  defaultZoom = 7;
}


var map = new GMaps({
    div: '#map',
    lat: centralUKLat,
    lng: centralUKLong,
    zoom: defaultZoom
  });

fetchMap = function(postcode) {
  GMaps.geocode({
    address: postcode,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        map.setCenter(latlng.lat(), latlng.lng());
        map.setZoom(15);
        map.addMarker({
          lat: latlng.lat(),
          lng: latlng.lng()
        });
      }
    }
  });
};

$("#user-postcode").submit(function(event) {
  event.preventDefault();
  var postcode = $("#postcode").val();
  fetchMap(postcode);
});