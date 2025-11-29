document.addEventListener("DOMContentLoaded", () => {
  console.log("✅ homepage_foods.js loaded!");

  const foods = [
    "beef_bowl", "bread", "broccoli", "carrot", "coffee",
    "croissant", "donut", "fish", "fried_egg", "hamburger",
    "juice", "onigiri", "onion", "pancakes", "pasta",
    "potato", "ramen", "roast_chicken", "steak", "sushi",
    "strawberry", "tomato"
  ];

  const foodImages = document.querySelectorAll(".food");

  // ✅ 各画像にランダムなアニメーションディレイを設定
  foodImages.forEach(img => {
    const randomDelay = Math.random() * 2; // 0〜2秒
    img.style.animationDelay = `${randomDelay}s`;
  });

  // 画像をランダムにフェード切り替え
  function replaceRandomFood() {
    // ✅ 一度に変える画像の枚数をランダムに（1〜3枚）
    const changeCount = Math.floor(Math.random() * 3) + 1;

    for (let i = 0; i < changeCount; i++) {
      const target = foodImages[Math.floor(Math.random() * foodImages.length)];
      const newFood = foods[Math.floor(Math.random() * foods.length)];
      const meta = document.querySelector(`meta[name='food-${newFood}']`);

      if (!meta) {
        console.warn(`⚠️ metaタグが見つかりません: ${newFood}`);
        continue;
      }

      const imageUrl = meta.content;

      // フェードアウト
      target.style.transition = "opacity 5s ease";
      target.style.opacity = 0;

      // 5秒後にフェードイン
      setTimeout(() => {
        target.src = imageUrl;
        target.style.transition = "opacity 5s ease";
        target.style.opacity = 1;
      }, 5000);
    }
  }


  // 3秒ごとにランダム画像切り替え
  setInterval(replaceRandomFood, 3000);
});
