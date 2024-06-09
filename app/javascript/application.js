import "core-js/stable";
import "regenerator-runtime/runtime";
import $ from 'jquery';
import 'bootstrap';
import './scripts.js';  // 修正箇所

window.$ = $;
window.jQuery = $;

document.addEventListener("DOMContentLoaded", function() {
  var flashNotice = document.querySelector(".alert");

  if (flashNotice) {
    alert(flashNotice.textContent.trim());
  }

  // vision_api.jsのコードをここに追加
  if (document.URL.match(/new/)) {
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
  }

  // プレビュー画像を表示する関数
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
