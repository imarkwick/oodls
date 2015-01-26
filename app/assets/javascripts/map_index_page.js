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

tescoImage = function(){
  return image = {
    url: 'images/tescomarker.png',
    size: new google.maps.Size(27, 35),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(14,35)
  };
};

addTescoMarkers = function(){
  $.getJSON('data/tescolonglat.json', function(json){
    for(var i in json){
      map.addMarker({
        lat: json[i][0],
        lng: json[i][1],
        icon: tescoImage(),
        infoWindow:{
          content: 'Donation point'
        },
        mouseover: function(event){
          this.infoWindow.open(this.map, this);
        },
        mouseout: function(event){
          this.infoWindow.close(this.map, this);
        }
      });
    };
  });
};


markerImage = function(url){
  return image = {
    url: url,
    size: new google.maps.Size(20, 33),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(10,33)
  };
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

getCharityData = function(){
  var charity_data = $('.charity_data_class').data('charities-for-map');
  assembleCharityMarkers(charity_data);
};

processCharityRequirements = function(i, charity_data){
  return $.map(charity_data[i].requirements, function(req){
    return req.label;
  });
};

renderInfoWindow = function(i, charity_data, requirements){
  var html = $('#charity-info-window').html();
  var data = {organisation: charity_data[i].organisation,
              food_requirements: requirements,
              weekday_hours: charity_data[i].weekday_hours,
              weekend_hours: charity_data[i].weekend_hours,
              id: charity_data[i].id
            }
  return Mustache.render(html,data);
};

addCharityMarkers = function(i, charity_data, charity_info){
  map.addMarker({
    lat: charity_data[i].lat,
    lng: charity_data[i].lon,
    icon: markerImage('images/oodls-pin-white.png'),
    animation: google.maps.Animation.DROP,
    infoWindow:{
      content: charity_info
    },
    mouseover: function(event){
      this.infoWindow.open(this.map, this);
    }
  });
};

assembleCharityMarkers = function(charity_data){
  for(var i in charity_data){
    var requirements = processCharityRequirements(i, charity_data).join(", ");
    var charity_info = renderInfoWindow(i, charity_data, requirements);
    addCharityMarkers(i, charity_data, charity_info);
  };
};

assembleMap = function(postcode) {
  GMaps.geocode({
    address: postcode,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        setUserPosition(latlng.lat(), latlng.lng())
        hideSplashImages();
        returnSearchBoxToTop();
        generateMap(latlng.lat(), latlng.lng());
        addUserMarker(latlng.lat(), latlng.lng());
        addTescoMarkers();
        getCharityData();
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

hideSplashImages = function () {
  $("#splash").fadeOut();
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
