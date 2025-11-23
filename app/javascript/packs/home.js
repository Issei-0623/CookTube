document.addEventListener("DOMContentLoaded", () => {
  const foods = document.querySelectorAll(".food");
  foods.forEach(food => {
    food.style.transition = "transform 5s ease-in-out";
    setInterval(() => {
      const x = (Math.random() - 0.5) * 20;
      const y = (Math.random() - 0.5) * 20;
      food.style.transform = `translate(${x}px, ${y}px)`;
    }, 4000);
  });
});