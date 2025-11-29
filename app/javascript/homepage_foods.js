document.addEventListener("DOMContentLoaded", () => {
  console.log("✅ homepage_foods.js loaded");

  const foods = [
    "beef_bowl", "bread", "broccoli", "carrot", "coffee", "croissant", "donut",
    "fish", "fried_egg", "hamburger", "juice", "onigiri", "onion", "pancakes",
    "pasta", "potato", "ramen", "roast__chicken", "steak", "sushi", "strawberry", "tomato"
  ];

  const foodImages = document.querySelectorAll(".food");

  function replaceRandomFood() {
    const target = foodImages[Math.floor(Math.random() * foodImages.length)];
    const newFood = foods[Math.floor(Math.random() * foods.length)];

    // ✅ metaからRailsが生成したURLを取得
    const imageUrl = document.querySelector(`meta[name='food-${newFood}']`).content;
    target.src = imageUrl;
    console.log(`🍳 Replacing → ${imageUrl}`);
  }

  setInterval(replaceRandomFood, 3000);
});
