$(document).ready(function() {
  var carousel = $("#splash");

  carousel.owlCarousel({
    autoPlay: 5000, //Set AutoPlay to 3 seconds
    items : 1,
    itemsDesktop : [1199,1],
    itemsDesktopSmall : [979,1],
    itemsTablet: [768,1],
    itemsTabletSmall: 1,
    itemsMobile : [479,1],
    singleItem : true,
    itemsScaleUp : true,
    responsive: false
  });

});
