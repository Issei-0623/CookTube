document.addEventListener("turbo:load", () => {
  console.log("🏠 homepage_foods.js loaded");

  const images = document.querySelectorAll(".food");
  if (images.length === 0) return;

  FoodBackground.applyInitialSettings(images);
  setInterval(() => FoodBackground.replaceRandomFoods(images), 4000);
});
