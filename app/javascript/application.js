import "core-js/stable";
import "regenerator-runtime/runtime";
import $ from 'jquery';
import 'bootstrap';
import(/* webpackChunkName: "scripts" */ './scripts.js');

window.$ = $;
window.jQuery = $;

document.addEventListener("DOMContentLoaded", function() {
  var flashNotice = document.querySelector(".alert");

  if (flashNotice) {
    alert(flashNotice.textContent.trim());
  }

  if (document.URL.match(/new/)) {
    import(/* webpackChunkName: "vision_api" */ './vision_api.js').then(module => {
      const visionAPI = module.default;

      $(document).on('change', 'input[type="file"]', function(e) {
        e.preventDefault();
        var formData = new FormData();
        formData.append("image", e.target.files[0]);
        $.ajax({
          type: 'POST',
          url: '/vision_api/upload',
          data: formData,
          dataType: 'json',
          processData: false,
          contentType: false,
          headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          }
        })
        .done(function(data){
          $('#closet_name').val(data.name);
          $('#closet_name').css('background-color', 'lightgreen');
        })
        .fail(function(){
          alert('画像の読み込みに失敗しました');
        });
      });
    });
  }

  function previewImage(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function (e) {
        $('#preview-image').attr('src', e.target.result);
      }
      
      reader.readAsDataURL(input.files[0]);
    }
  }

  $(document).on('change', '#user_image, #image-upload', function() {
    previewImage(this);
  });
});