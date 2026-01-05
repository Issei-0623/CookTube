// =============================
// 食べ物リスト（全ページ共通）
// =============================
const FOODS = [
  "beef_bowl", "bread", "broccoli", "carrot", "coffee",
  "croissant", "donut", "fish", "fried_egg", "hamburger",
  "juice", "onigiri", "onion", "pancakes", "pasta",
  "potato", "ramen", "roast_chicken", "steak", "sushi",
  "strawberry", "tomato"
];

// =============================
// 初期サイズ・ディレイ設定
// =============================
function applyInitialSettings(images) {
  images.forEach(img => {
    const randomSize = Math.floor(Math.random() * 120) + 200;
    img.style.width = `${randomSize}px`;

    const randomDelay = (Math.random() * 2).toFixed(2);
    img.style.animationDelay = `${randomDelay}s`;
  });
}

// =============================
// ランダム入れ替え
// =============================
function replaceRandomFoods(images) {
  const changeCount = Math.floor(Math.random() * 3) + 2;

  for (let i = 0; i < changeCount; i++) {
    const target = images[Math.floor(Math.random() * images.length)];
    const newFood = FOODS[Math.floor(Math.random() * FOODS.length)];

    const meta = document.querySelector(`meta[name='food-${newFood}']`);
    if (!meta) continue;

    const imageUrl = meta.content;

    target.style.transition = "opacity 4s ease";
    target.style.opacity = 0;

    setTimeout(() => {
      target.src = imageUrl;

      const newSize = Math.floor(Math.random() * 200) + 300;
      target.style.width = `${newSize}px`;

      target.style.transition = "opacity 4s ease";
      target.style.opacity = 0.5;
    }, 4000);
  }
}

// =============================
// 外部から使うため global 化
// =============================
window.FoodBackground = {
  applyInitialSettings,
  replaceRandomFoods
};
