$(document).ready(() => {
  // Variables
  const $nav = $(".navbar");

  if (!$nav.length) return;

  const $body = $("body");
  const $window = $(window);
  let navOffsetTop = $nav.offset().top;
  // const $document = $(document);
  // const entityMap = {
  //   "&": "&amp;",
  //   "<": "&lt;",
  //   ">": "&gt;",
  //   '"': "&quot;",
  //   "'": "&#39;",
  //   "/": "&#x2F;"
  // };

  function init() {
    $window.on("scroll", onScroll);
    $window.on("resize", resize);
    $('a[href^="#"]').on("click", smoothScroll);
  }

  function smoothScroll(e) {
    e.preventDefault();
    $(document).off("scroll");
    const target = this.hash;
    const $target = $(target);
    $("html, body")
      .stop()
      .animate(
        {
          scrollTop: $target.offset().top - 40
        },
        0,
        "swing",
        () => {
          window.location.hash = target;
          $(document).on("scroll", onScroll);
        }
      );
  }

  function resize() {
    $body.removeClass("has-docked-nav");
    navOffsetTop = $nav.offset().top;
    onScroll();
  }

  function onScroll() {
    if (
      navOffsetTop < $window.scrollTop() &&
      !$body.hasClass("has-docked-nav")
    ) {
      $body.addClass("has-docked-nav");
    }
    if (
      navOffsetTop > $window.scrollTop() &&
      $body.hasClass("has-docked-nav")
    ) {
      $body.removeClass("has-docked-nav");
    }
  }

  init();
});
