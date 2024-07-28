;(function($){
  "use strict";

  $(function(){
      var mapContainer = $("#map-container");
      var canvas = mapContainer.find("canvas");

      // コンテナのサイズをキャンバスに設定
      canvas.attr("width", mapContainer.width());
      canvas.attr("height", mapContainer.height());

      var showWeatherPath = mapContainer.data("show-weather-path");

      mapContainer.japanMap({
          onSelect : function(data){
              var url = showWeatherPath + "?city=" + encodeURIComponent(data.name);
              window.location.href = url;
          }
      });
  });

})(jQuery);
