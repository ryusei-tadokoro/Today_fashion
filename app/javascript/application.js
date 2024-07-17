import "core-js/stable";
import "regenerator-runtime/runtime";
import Rails from "@rails/ujs";
import $ from "jquery";
import "bootstrap";
import "./scripts"; // scripts.js
import "./closet_form"; // closet_form.js
import "./weather_map"; // weather_map.js
import "./japan_map"; // japan_map.js

if (typeof Rails !== 'undefined') {
  Rails.start();
}

window.$ = $;
window.jQuery = $;

$(document).ready(function() {
  var flashNotice = document.querySelector(".alert");
  if (flashNotice) {
    alert(flashNotice.textContent.trim());
    flashNotice.remove(); // アラートが表示された後に要素を削除
  }
  if (document.URL.match(/new/)) {
    import(/* webpackChunkName: "vision_api" */ './vision_api').then(module => {
      const visionAPI = module.default;
      visionAPI();
    });
  }

  function previewImage(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('#preview-image').attr('src', e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
    }
  }

  $(document).on('change', '#user_image, #image-upload', function() {
    previewImage(this);
  });

  // CSRFトークンをヘッダーに設定
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': token
    }
  });

  // ここでjQueryのオブジェクトに対して.eachを使用します。
  $('[data-refresh-csrf]').each(function() {
    var element = $(this);
  });

  // カスタム削除確認ダイアログ
  $('a[data-method="delete"]').each(function(index, element) {
    $(element).on('click', function(event) {
      event.preventDefault();
      if (confirm('本当によろしいですか？')) {
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = this.href;

        var hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = '_method';
        hiddenField.value = 'delete';

        form.appendChild(hiddenField);

        var csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        var csrfField = document.createElement('input');
        csrfField.type = 'hidden';
        csrfField.name = 'authenticity_token';
        csrfField.value = csrfToken;

        form.appendChild(csrfField);
        document.body.appendChild(form);
        form.submit();
      } else {
        return false;
      }
    });
  });
});
