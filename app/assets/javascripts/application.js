//= require rails-ujs
//= require jquery
//= require_tree .

document.addEventListener("DOMContentLoaded", function() {
  var flashNotice = document.querySelector(".alert");

  if (flashNotice) {
    alert(flashNotice.textContent.trim());
  }

  $(document).on('change', '#user_image', function() {
    readURL(this);
    previewImage(this); // 追加
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('#image_preview').attr('src', e.target.result);
        $('#image_preview').show();
      };

      reader.readAsDataURL(input.files[0]);
    }
  }

  function previewImage(input) {
    var preview = document.getElementById('image-preview');
    preview.innerHTML = '';

    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        var img = document.createElement('img');
        img.src = e.target.result;
        img.style.maxWidth = '100%';
        img.style.maxHeight = '200px';
        preview.appendChild(img);
      }

      reader.readAsDataURL(input.files[0]);
    }
  }
});

