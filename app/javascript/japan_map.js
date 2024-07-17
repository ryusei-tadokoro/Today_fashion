import * as d3 from 'd3';
import { Jmap } from 'jmap';

document.addEventListener('DOMContentLoaded', function() {
  var weatherData = JSON.parse(document.getElementById('japan-map').dataset.weather);

  var map = new Jmap({
    target: '#japan-map',
    width: 800,
    height: 600,
    onSelect: function(data) {
      var weather = weatherData.find(w => w.code === data.code);
      if (weather) {
        alert(`
          地域: ${weather.name}
          気温: ${weather.temp_max.toFixed(1)} °C / ${weather.temp_min.toFixed(1)} °C
          天気: ${weather.description}
          服装指数: ${weather.dress_index}
        `);
      }
    }
  });

  weatherData.forEach(function(location) {
    var region = document.querySelector(`#japan-map [data-code='${location.code}']`);
    if (region) {
      region.style.fill = 'blue'; // 天気情報がある地域を色付け
    }
  });
});
