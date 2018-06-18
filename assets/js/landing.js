(function() {
  function navigateToPage(page) {
    return function() {
      window.location.href = `/${page}`;
    };
  }

  $(".hero-card--nyc").click(navigateToPage("nyc"));
  $(".hero-card--la").click(navigateToPage("la"));
})();
