var userLatitude, userLongitude;

if (!navigator.geolocation) {
  $("#user-geolocation").hide();
};

var map;

generateMap = function(latitude, longitude) {
  map = new GMaps({
    div: '#map',
    lat: latitude,
    lng: longitude,
    zoom: 15,
    disableDefaultUI: true
  });
};

var image = {
  url: 'images/oodls-pin-white.png',
  size: new google.maps.Size(20, 33),
  origin: new google.maps.Point(0,0),
  anchor: new google.maps.Point(0,0)
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
  var charity_data = $('.charity_data_class').data('charities-for-map');
  for(var i in charity_data){
    var requirements = $.map(charity_data[i].requirements, function(req) { return req.label; }).join(", ");
    var charity_info = "<p><b>" + charity_data[i].organisation + "</b>" + "<br />" + "<b>We are currently accepting:</b>" + "<br />" + requirements + "<br />" + "<b>Weekday opening hours:</b>" + "<br />" + charity_data[i].weekday_hours + "<br />" + "<b>Weekend opening hours:</b>" + "<br />" + charity_data[i].weekend_hours + '<p><a href="/charities/' + charity_data[i].id + '">Click here for more info</a></p>';
    map.addMarker({
      lat: charity_data[i].lat, 
      lng: charity_data[i].lon,
      icon: image,
      animation: google.maps.Animation.DROP,
      infoWindow:{
        content: charity_info
      },
      mouseover: function(event){
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
        returnSearchBoxToTop();
        generateMap(latlng.lat(), latlng.lng());
        addUserMarker(latlng.lat(), latlng.lng());
        addCharityMarkers();
        $("#postcode").css("border", "1px solid #cccccc");
      }
      else {
        $("#postcode").css("border", "1px solid red");
        $("#postcode").val('Please enter a valid address...');
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
  $(".search-box").addClass("align-search-box", 1000, "easeInOutCubic")
};

$("#user-postcode").submit(function(event) {
  event.preventDefault();
  var userPostcode = $("#postcode").val();
  assembleMap(userPostcode);
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