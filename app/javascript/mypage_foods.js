document.addEventListener("turbo:load", () => {
  console.log("📘 mypage_foods.js loaded");

  const images = document.querySelectorAll(".bg-food");
  if (images.length === 0) return;

  FoodBackground.applyInitialSettings(images);
  setInterval(() => FoodBackground.replaceRandomFoods(images), 4000);
});
