import "@hotwired/turbo-rails"

// フォルダフォームの開閉
document.addEventListener("turbo:load", () => {
  const btn = document.getElementById("show-folder-form");
  const form = document.getElementById("folder-form");

  if (btn && form) {
    btn.addEventListener("click", () => {
      form.style.display = (form.style.display === "none") ? "block" : "none";
    });
  }
});

// アバターメニューの開閉
document.addEventListener("turbo:load", () => {
  const plusBtn = document.querySelector(".plus-btn");
  const menu = document.querySelector(".avatar-menu");

  if (plusBtn && menu) {

    plusBtn.addEventListener("click", (event) => {
      event.stopPropagation();
      menu.classList.toggle("active");
    });

    menu.addEventListener("click", (event) => {
      event.stopPropagation();
    });

    document.addEventListener("click", () => {
      menu.classList.remove("active");
    });
  }
});

// アバター画像変更の自動送信
document.addEventListener("turbo:load", () => {
  const fileInput = document.querySelector("#user_avatar");

  if (fileInput) {
    fileInput.addEventListener("change", () => {
      fileInput.form.requestSubmit();
    });
  }
});
