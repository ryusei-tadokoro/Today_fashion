//= require rails-ujs
//= require jquery
//= require_tree .

document.addEventListener("DOMContentLoaded", function() {
  var flashNotice = document.querySelector(".alert");

  if (flashNotice) {
    alert(flashNotice.textContent.trim());
  }

  $(document).on('change', '#user_image, #image-upload', function() {
    previewImage(this);
  });

  function previewImage(input) {
    var preview = document.getElementById('preview-image');
    preview.innerHTML = '';

    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        preview.src = e.target.result;
      }

      reader.readAsDataURL(input.files[0]);
    }
  }
});
