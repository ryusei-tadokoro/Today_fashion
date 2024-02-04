document.addEventListener("DOMContentLoaded", function() {
  const categorySelect = document.getElementById("closet_category_id");
  const subcategorySelect = document.getElementById("closet_subcategory_id");
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const imageUploadInput = document.getElementById('image-upload');

  imageUploadInput.addEventListener('change', function(event) {
    const file = event.target.files[0];
    const formData = new FormData();
    formData.append('image', file);

    fetch('/closets/analyze_image', {
      method: 'POST',
      headers: {
        'X-CSRF-Token': token
      },
      body: formData,
      credentials: 'include'
    })
    .then(response => response.json())
    .then(data => {
      if (data.name) {
        document.getElementById('closet_name').value = data.name; 
        document.getElementById('auto-fill-notice').style.display = 'block';
      }
    })
    .catch(error => console.error('Error:', error));
  });

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
