var userLatitude, userLongitude;

var map;

if (!navigator.geolocation) {
  $("#user-geolocation").hide();
};

returnSearchBoxToBottom = function () {
  $('.twitter').fadeOut(1000);
  $(".search-box").delay(1000).addClass("align-search-box", 1000, "easeInOutCubic");
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
  returnSearchBoxToBottom();
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

spinner = function() {
  $('.spinner').css("opacity", "1");
  $('body').css("background-color", "#E5E3DF");
  $('#splash').hide();
}

spinnerFadeOut = function() {
  $('.spinner').css("opacity", "0");
}

fetchLocation = function() {
  spinner();
  navigator.geolocation.getCurrentPosition(function(position) {
    setUserPosition(position.coords.latitude, position.coords.longitude)
    var browserCoordinates = position.coords.latitude + ", " + position.coords.longitude
    assembleMap(browserCoordinates);
    spinnerFadeOut();
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

infoWindowDisplay = function(windowContent){
  return infoWindow = {
    content: windowContent,
    closeclick: function(event){
      $('.search-box').fadeIn(1000);
    }
  }
};

addTescoMarkers = function(tesco_info){
  $.getJSON('data/tescolonglat.json', function(json){
    for(var i in json){
      map.addMarker({
        lat: json[i][0],
        lng: json[i][1],
        icon: markerImage('images/tesco-pin.svg', 30, 48, 0, 0, 15, 48),
        animation: google.maps.Animation.DROP,
        infoWindow: infoWindowDisplay($('#tesco-info-window').html()),
        click: function(event){
          this.infoWindow.open(this.map, this);
          $('.search-box').fadeIn(1000);
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
    return "<li><img id='window-icons' src='/images/icons/" + req.heading + ".svg'>" + req.label + "</li>";
  });
};

addCharityMarkers = function(i, charity_data, charity_info){
  map.addMarker({
    lat: charity_data[i].lat,
    lng: charity_data[i].lon,
    icon: markerImage('images/oodls-pin.svg', 30, 48, 0, 0, 15, 48),
    animation: google.maps.Animation.DROP,
    infoWindow: infoWindowDisplay(charity_info),
    click: function(event){
      this.infoWindow.open(this.map, this);
      $('.search-box').fadeOut(1000);
    }
  });
};

assembleCharityMarkers = function(charity_data){
  for(var i in charity_data){
    var requirements = processCharityRequirements(i, charity_data).join('');
    var charity_info = fillInfoWindow(i, charity_data, requirements);
    addCharityMarkers(i, charity_data, charity_info);
  };
};

fillInfoWindow = function(i, charity_data, requirements){
  var html = $('#charity-info-window').html();
  var data = {organisation: charity_data[i].organisation,
              food_requirements: requirements,
              weekday_hours: charity_data[i].weekday_hours,
              weekend_hours: charity_data[i].weekend_hours,
              id: charity_data[i].id,
              lat: charity_data[i].lat,
              lon: charity_data[i].lon
            };
  return Mustache.render(html,data);
};

var styles = [
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      { "color": "#62a905" }
    ]
  },{
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#F9F9F9" }
    ]
  },{
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      { "weight": 0.5 }
    ]
  },{
    "featureType": "road.arterial",
    "elementType": "geometry.stroke",
    "stylers": [
      { "weight": 0.5 }
    ]
  },{
    "featureType": "road.local",
    "elementType": "geometry.stroke",
    "stylers": [
      { "weight": 0.2 }
    ]
  },{
    "featureType": "road",
    "elementType": "labels",
    "stylers": [
      { "weight": 0.1 },
      { "color": "#362009" }
    ]
  },{
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "landscape",
    "elementType": "geometry.fill",
    "stylers": [
      { "color": "#EEEEEE" }
    ]
  },{
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "poi",
    "elementType": "labels",
    "stylers": [
      { "visibility": "off" }
    ]
  }
];

styleMap = function() {
  map.addStyle({
      styledMapName:"Styled Map",
      styles: styles,
      mapTypeId: "map_style"
  });
};

applyMapStyle = function() {
  map.setStyle("map_style");
};

assembleMap = function(postcode) {
  GMaps.geocode({
    address: postcode,
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        setUserPosition(latlng.lat(), latlng.lng())
        hideSplashImages();
        returnSearchBoxToBottom();
        generateMap(latlng.lat(), latlng.lng());
        styleMap();
        applyMapStyle();
        addUserMarker(latlng.lat(), latlng.lng());
        addTescoMarkers();
        getCharityData();
      }
      else {
        $("#postcode").notify("Please enter a valid address", "error",  { position:"top" });
        $('input:text').click(function() {
          $(this).val('');
        });
      }
    }
  });
};
