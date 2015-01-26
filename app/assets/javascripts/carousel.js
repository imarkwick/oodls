$(document).ready(function() {
  var carousel = $("#splash");

  carousel.owlCarousel({
    loop: true,
    autoplay: 20000,
    autplayTimeout: 3000,
    items: 1,
    margin: 0,
    slideSpeed: 900
  });

});
