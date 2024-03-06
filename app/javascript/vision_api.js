$(function(){
  if(document.URL.match(/new/)) { // URLが適切なパスにマッチするか確認
    $(document).on('change', 'input[type="file"]#user_image, input[type="file"]#image-upload', function(e) {
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
});
