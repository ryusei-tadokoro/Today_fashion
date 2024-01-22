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
});
