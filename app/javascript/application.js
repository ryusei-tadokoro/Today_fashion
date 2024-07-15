import Rails from "@rails/ujs";
Rails.start();

import "core-js/stable";
import "regenerator-runtime/runtime";
import $ from 'jquery';
import 'bootstrap';
import './scripts.js';
import './closet_form.js';

window.$ = $;
window.jQuery = $;

document.addEventListener("DOMContentLoaded", function() {
  var flashNotice = document.querySelector(".alert");

  if (flashNotice) {
    alert(flashNotice.textContent.trim());
    flashNotice.remove(); // アラートが表示された後に要素を削除
  }

  if (document.URL.match(/new/)) {
    import(/* webpackChunkName: "vision_api" */ './vision_api.js').then(module => {
      const visionAPI = module.default;
      visionAPI();
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

  // CSRFトークンをヘッダーに設定
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': token
    }
  });

  // ここでjQueryのオブジェクトに対して$.eachを使用します。
  $('[data-refresh-csrf]').each(function() {
    var element = $(this);
  });
});
