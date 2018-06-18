(function() {
  function navigateToPage() {
    const $pane = $(this);

    window.location.href = $pane
      .find("a[data-selector='landing-button-link']")
      .first()
      .attr("href");
  }

  $(".hero-card--nyc").click(navigateToPage);
  $(".hero-card--la").click(navigateToPage);
})();
