document.addEventListener("DOMContentLoaded", function() {
  const categorySelect = document.getElementById("closet_category_id");
  const subcategorySelect = document.getElementById("closet_subcategory_id");

  categorySelect.addEventListener("change", function() {
    const categoryId = categorySelect.value;

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
      .catch(error => console.error("Error fetching subcategories:", error));
  });
});
