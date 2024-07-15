import $ from 'jquery';

export default function visionAPI() {
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
    .done(function(data) {
      const translatedName = `${data.name} (${data.translated_name})`;
      $('#closet_name').val(translatedName);
      $('#closet_name').css('background-color', 'lightgreen');
    })
    .fail(function() {
      alert('画像の読み込みに失敗しました');
    });
  });
}
