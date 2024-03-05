// TurboとStimulusをImportmapからimportする
import "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";
import controllers from "controllers";

// Stimulusの設定
const application = Application.start();
application.load(definitionsFromContext(controllers));


document.addEventListener("DOMContentLoaded", function() {
  var flashNotice = document.querySelector(".alert");

  if (flashNotice) {
    alert(flashNotice.textContent.trim());
  }

  $(document).on('change', '#user_image, #image-upload', function() {
    previewImage(this);
  });

  function previewImage(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function (e) {
        $('#preview-image').attr('src', e.target.result);
      }
      
      reader.readAsDataURL(input.files[0]);
    }
  }
});
