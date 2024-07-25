;(function($){
  "use strict";

  // Define the prefectures and map data below as per your requirements
  var definition_of_allJapan = {/* 全日本のデータをここに定義 */};
  var definition_of_prefectures = {/* 県データをここに定義 */};

  $(function(){
      var mapContainer = $("#map-container");
      var canvas = mapContainer.find("canvas");
      
      // コンテナのサイズをキャンバスに設定
      canvas.attr("width", mapContainer.width());
      canvas.attr("height", mapContainer.height());

      mapContainer.japanMap({
          onSelect : function(data){
              alert(data.name);
          }
      });
  });

})(jQuery);
