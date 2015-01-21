// include http://maps.google.com/maps/api/js?sensor=true
// include app/assets/javascripts/gmaps.js
// include app/assets/javascripts/charity_map.js
//= require gmaps
//= require charity_map

describe("user latitude and longitude", function() {

  it("should initially be undefined", function() {
    expect(userLatitude).toBe(undefined);
    expect(userLongitude).toBe(undefined);
  });

  it("should be set with setUserPosition", function() {
    setUserPosition(-45, 0);
    expect(userLatitude).toBe(-45);
    expect(userLongitude).toBe(0);
  });

});
