document.addEventListener("DOMContentLoaded", function() {
  const categorySelect = document.getElementById("closet_category_id");
  const subcategorySelect = document.getElementById("closet_subcategory_id");

  if (categorySelect) {
    categorySelect.addEventListener("change", function() {
      const categoryId = categorySelect.value;

      if (categoryId === "") {
        // カテゴリーが選択されていない場合、サブカテゴリーを空にして無効にする
        subcategorySelect.innerHTML = '<option value="">選択してください</option>';
        subcategorySelect.disabled = true;
      } else {
        // カテゴリーが選択された場合、対応するサブカテゴリーの選択肢を取得する
        fetch(`/closets/subcategories_for_category/${categoryId}`)
          .then(response => response.json())
          .then(data => {
            subcategorySelect.innerHTML = '<option value="">選択してください</option>';
            data.forEach(subcategory => {
              const option = document.createElement("option");
              option.value = subcategory.id;
              option.text = subcategory.name;
              subcategorySelect.appendChild(option);
            });

            // サブカテゴリーのドロップダウンを有効にする
            subcategorySelect.disabled = false;
          })
      }
    });
  }
});

function loadSubcategories(categoryId) {
  const subcategorySelect = document.getElementById("closet_subcategory_id");

  if (categoryId === "") {
    // カテゴリーが選択されていない場合、サブカテゴリーを空にして無効にする
    subcategorySelect.innerHTML = '<option value="">選択してください</option>';
    subcategorySelect.disabled = true;
  } else {
    // カテゴリーが選択された場合、対応するサブカテゴリーの選択肢を取得する
    fetch(`/closets/subcategories_for_category/${categoryId}`)
      .then(response => response.json())
      .then(data => {
        subcategorySelect.innerHTML = '<option value="">選択してください</option>';
        data.forEach(subcategory => {
          const option = document.createElement("option");
          option.value = subcategory.id;
          option.text = subcategory.name;
          subcategorySelect.appendChild(option);
        });
        subcategorySelect.disabled = false;
      })
  }
}

window.loadSubcategories = loadSubcategories; // グローバルスコープに追加
