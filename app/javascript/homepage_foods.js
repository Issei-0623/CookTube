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

  //  初期サイズをランダムに設定
  foodImages.forEach(img => {
    const randomSize = Math.floor(Math.random() * 120) + 200;
    img.style.width = `${randomSize}px`;

    // アニメーションのディレイをランダムにして動きにゆらぎを出す
    const randomDelay = (Math.random() * 2).toFixed(2);
    img.style.animationDelay = `${randomDelay}s`;
  });

  //  フェードイン/アウトでランダム入れ替え
  function replaceRandomFood() {
    const changeCount = Math.floor(Math.random() * 3) + 2;

    for (let i = 0; i < changeCount; i++) {
      const target = foodImages[Math.floor(Math.random() * foodImages.length)];
      const newFood = foods[Math.floor(Math.random() * foods.length)];
      const meta = document.querySelector(`meta[name='food-${newFood}']`);
      if (!meta) continue;

      const imageUrl = meta.content;

      target.style.transition = "opacity 4s ease";
      target.style.opacity = 0;

      setTimeout(() => {
        target.src = imageUrl;

        // 差し替え時にもサイズをランダムで再設定
        const newSize = Math.floor(Math.random() * 200) + 300;
        target.style.width = `${newSize}px`;

        target.style.transition = "opacity 4s ease";
        target.style.opacity = 1;
      }, 4000);
    }
  }

  // 4秒ごとにランダムで入れ替え
  setInterval(replaceRandomFood, 4000);
});
