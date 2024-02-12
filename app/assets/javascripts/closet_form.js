document.addEventListener("DOMContentLoaded", function() {
  const categorySelect = document.getElementById("closet_category_id");
  const subcategorySelect = document.getElementById("closet_subcategory_id");

  categorySelect.addEventListener("change", function() {
    const categoryId = categorySelect.value;

    // カテゴリーが選択されたら、対応するサブカテゴリーの選択肢を取得する
    fetch(`/closets/subcategories_for_category/${categoryId}`)
      .then(response => response.json())
      .then(data => {
        // サブカテゴリーの選択肢を更新
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
      .catch(error => console.error("Error fetching subcategories:", error));
  });
});