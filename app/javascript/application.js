import "homepage_foods";
import "@hotwired/turbo-rails"


document.addEventListener("DOMContentLoaded", () => {
  const btn = document.getElementById("show-folder-form");
  const form = document.getElementById("folder-form");

  if (btn && form) {
    btn.addEventListener("click", () => {
      form.style.display = (form.style.display === "none") ? "block" : "none";
    });
  }
});
