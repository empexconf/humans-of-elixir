(function() {
  const $gallery = $(".gallery-display");
  const $carousel = $(".gallery-carousel");

  $gallery.slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true
  });

  $carousel.slick({
    speed: 300,
    centerMode: true,
    arrows: false,
    infinite: true,
    slidesToShow: 3,
    centerPadding: "10px",
    swipeToSlide: true,
    focusOnSelect: true
  });
})();
