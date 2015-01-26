var userLatitude, userLongitude;

if (!navigator.geolocation) {
  $("#user-geolocation").hide();
};

var map;

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

generateMap = function(latitude, longitude) {
  map = new GMaps({
    div: '#map',
    lat: latitude,
    lng: longitude,
    zoom: 15,
    disableDefaultUI: true
  });
};

fetchLocation = function() {
  navigator.geolocation.getCurrentPosition(function(position) {
    setUserPosition(position.coords.latitude, position.coords.longitude)
    var browserCoordinates = position.coords.latitude + ", " + position.coords.longitude
    assembleMap(browserCoordinates);
  });
};

setUserPosition = function(latitude, longitude) {
  userLatitude = latitude;
  userLongitude = longitude;
};

addUserMarker = function(latitude, longitude) {
  map.addMarker({
    lat: latitude,
    lng: longitude
  });
};

markerImage = function(url, size_x, size_y, origin_x, origin_y, anchor_x, anchor_y){
  return image = {
    url: url,
    size: new google.maps.Size(size_x, size_y),
    origin: new google.maps.Point(origin_x, origin_y),
    anchor: new google.maps.Point(anchor_x, anchor_y)
  };
};

addTescoMarkers = function(){
  $.getJSON('data/tescolonglat.json', function(json){
    for(var i in json){
      map.addMarker({
        lat: json[i][0],
        lng: json[i][1],
        icon: markerImage('images/tescomarker.png', 27, 35, 0, 0, 14, 35),
        infoWindow:{
          content: '<p>Donation point</p>'
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

getCharityData = function(){
  var charity_data = $('.charity_data_class').data('charities-for-map');
  assembleCharityMarkers(charity_data);
};

processCharityRequirements = function(i, charity_data){
  return $.map(charity_data[i].requirements, function(req){
    return req.label + "<img src='/images/icons/" + req.heading + ".svg' width='25' height='25'>";
  });
};

addCharityMarkers = function(i, charity_data, charity_info){
  map.addMarker({
    lat: charity_data[i].lat,
    lng: charity_data[i].lon,
    icon: markerImage('images/oodls-pin-white.png', 20, 33, 0, 0, 10, 33),
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