"use strict";

(function() {
  let $moon = document.querySelector("#moon div");
  if (!$moon) return;

  const $body = document.querySelector("body");

  // Disable animations/transitions until everything's loaded.
  $body.classList.add("is-loading");

  window.addEventListener("load", () => {
    window.setTimeout(() => {
      $body.classList.remove("is-loading");
      $moon = document.querySelector("#moon div");
      $moon.classList.add("visible");
    }, 100);
  });
})();
