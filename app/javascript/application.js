// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import jquery from "jquery"
window.$ = jquery

document.addEventListener("DOMContentLoaded", function() {
  var flashNotice = document.querySelector(".alert");

  if (flashNotice) {
    alert(flashNotice.textContent.trim());
  }

  // vision_api.jsのコードをここに追加
  if (document.URL.match(/new/)) { // URLが適切なパスにマッチするか確認
    $(document).on('change', 'input[type="file"]', function(e) {
      e.preventDefault();
      var formData = new FormData();
      formData.append("image", e.target.files[0]);
      $.ajax({
        type: 'POST',
        url: '/vision_api/upload', // 適切なエンドポイントに変更
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false,
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          }
      })
      .done(function(data){
        $('#closet_name').val(data.name); // フォームフィールドにラベル名を設定
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
