import "core-js/stable";
import "regenerator-runtime/runtime";
import Rails from "@rails/ujs";
import $ from "jquery";
import "bootstrap";
import "./scripts"; // scripts.js
import "./closet_form"; // closet_form.js
import "./jquery.japan-map.min.js";

if (typeof Rails !== 'undefined') {
  Rails.start();
}

window.$ = $;
window.jQuery = $;

$(document).ready(function() {
  var flashNotice = document.querySelector(".alert");
  if (flashNotice) {
    alert(flashNotice.textContent.trim());
    flashNotice.remove();
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

  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': token
    }
  });

  $('[data-refresh-csrf]').each(function() {
    var element = $(this);
  });

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

  // 日本地図の設定
  $("#map-container").japanMap({
    width: 600,
    onSelect : function(data){
      alert(data.name);
    }
  });
});
